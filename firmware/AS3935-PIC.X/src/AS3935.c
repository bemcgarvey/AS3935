#include <xc.h>
#include "AS3935.h"
#include "AS3935_hal.h"
#include <limits.h>

enum {
    PRESET_DEFAULT = 0x3c, CALIB_RCO = 0x3d, DIRECT_COMMAND = 0x96
};

char tuning = 0;
int freqCount = 0;
char doInterrupt = 0;
long antennaFrequency = 0;

char initAS3935(void) {
    initAS3935Hal();
    writeRegister(PRESET_DEFAULT, DIRECT_COMMAND);
    uint8_t reg = readRegister(0);
    reg >>= 1;
    reg &= 0b11111;
    if (reg != AFE_INDOOR) {
        return 0;
    }
    INTCON2bits.INTEDG1 = 1;
    INTCON3bits.INT1IP = 1;
    INTCON3bits.INT1IF = 0;
    INTCON3bits.INT1IE = 1;
    long freq = tuneAntenna();
    if (labs(freq - 500000) > 17500) {  //Must be within 3.5% of 500kHz
        return 0;
    } else {
        antennaFrequency = freq;
    }
    if (!calibrateOscillators()) {
        return 0;
    }
    return 1;
}

long tuneAntenna(void) {
    uint8_t reg;
    uint8_t best = 0;
    uint8_t milliseconds;
    int bestDiff = INT_MAX;
    long bestFreq = 0;
    INTCONbits.GIE = 0;
    tuning = 1;
    writeRegister(8, 0b10000000); //put LCO on IRQ pin
    //TODO can this be changed to Timer4?
    T3CONbits.TMR3ON = 0;
    T3CONbits.RD16 = 1;
    T3CONbits.T3CKPS = 0b11; //1:8 for 1 us per count
    T3CONbits.TMR3CS = 0;
    for (uint8_t i = 0; i < 16; ++i) {
        reg = 0b10000000 + i;
        writeRegister(8, reg);
        __delay_ms(2);
        TMR3 = (unsigned short)(-998);
        freqCount = 0;
        PIR2bits.TMR3IF = 0;
        T3CONbits.TMR3ON = 1;
        INTCONbits.GIE = 1;
        milliseconds = 100;
        while (milliseconds != 0) {
            while (PIR2bits.TMR3IF == 0);
            TMR3 = (unsigned short)(-998);
            PIR2bits.TMR3IF = 0;
            --milliseconds;
        }
        INTCONbits.GIE = 0;
        T3CONbits.TMR3ON = 0;
        int diff = freqCount - 3125;
        if (abs(diff) < bestDiff) {
            bestDiff = abs(diff);
            best = i;
            bestFreq = (long)freqCount * 160;
        }
    }
    writeRegister(8, best);
    tuning = 0;
    return bestFreq;
}

char calibrateOscillators(void) {
    writeRegister(CALIB_RCO, DIRECT_COMMAND);
    __delay_ms(2);
    uint8_t c = readRegister(0x3a);
    if ((c & 0b11000000) != 0b10000000) {
        return 0;
    }
    c = readRegister(0x3b);
    if ((c & 0b11000000) != 0b10000000) {
        return 0;
    }
    return 1;
}

void setPower(powerMode m) {
    uint8_t reg;
    reg = readRegister(0);
    reg &= 0b11111110;
    reg |= (m & 0b00000001);
    writeRegister(0, reg);
}

powerMode readPower(void) {
    uint8_t reg;
    reg = readRegister(0);
    return reg & 0b00000001;
}

void setAFEGain(afeGain gain) {
    uint8_t reg;
    reg = readRegister(0);
    reg &= 0b11000001;
    gain &= 0b00111110;
    reg |= (gain << 1);
    writeRegister(0, reg);
}

afeGain readAFEGain(void) {
    uint8_t reg;
    reg = readRegister(0);
    reg &= 0b00111110;
    return reg >> 1;
}

void clearStats(void) {
    uint8_t reg;
    reg = readRegister(2);
    reg &= 0b10111111;
    writeRegister(2, reg);
    reg |= 0b01000000;
    writeRegister(2, reg);
}

void setNoiseFloorLevel(uint8_t level) {
    uint8_t reg;
    reg = readRegister(1);
    reg &= 0b10001111;
    level &= 0b00000111;
    reg |= level << 4;
    writeRegister(1, reg);
}

uint8_t readNoiseFloorLevel(void) {
    uint8_t reg;
    reg = readRegister(1);
    reg &= 0b01110000;
    return reg >> 4;
}

void setWatchdogThreshold(uint8_t threshold) {
    uint8_t reg;
    reg = readRegister(1);
    reg &= 0b11110000;
    reg |= (threshold & 0b00001111);
    writeRegister(1, reg);
}
uint8_t readWatchdogThreshold(void) {
    uint8_t reg;
    reg = readRegister(1);
    return reg & 0b00001111;
}

uint8_t readDistance(void) {
    uint8_t reg;
    reg = readRegister(7);
    return reg & 0b00111111;
}

void processInterrupt(void) {
    if (tuning) {
        ++freqCount;
    } else {
        doInterrupt = 1;
    }
}

void setMinStrikes(minStrikes strikes) {
    uint8_t reg;
    reg = readRegister(2);
    reg &= 0b11001111;
    strikes &= 0b00000011;
    reg |= (strikes << 4);
    writeRegister(2, reg);
}

minStrikes readMinStrikes(void) {
    uint8_t reg;
    reg = readRegister(2);
    reg &= 0b00110000;
    return reg >> 4;
}

void setMaskDisturber(char mask) {
    uint8_t reg;
    reg = readRegister(3);
    reg &= 0b11011111;
    if (mask) {
        reg |= 0b00100000;
    }
    writeRegister(3, reg);
}

char readMaskDisturber(void) {
    uint8_t reg;
    reg = readRegister(3);
    return (reg & 0b00100000) != 0;
}

void setSpikeRejection(uint8_t sr) {
    uint8_t reg;
    reg = readRegister(2);
    reg &= 0b11110000;
    reg |= (sr & 0b00001111);
    writeRegister(2, reg);
}

uint8_t readSpikeRejection(void) {
    uint8_t reg;
    reg = readRegister(2);
    return reg & 0b00001111;
}

interruptSource readInterruptSource(void) {
    uint8_t reg;
    reg = readRegister(3);
    return reg & 0b00001111;
}

long getAntennaFrequency(void) {
    return antennaFrequency;
}