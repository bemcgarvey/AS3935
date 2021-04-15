
#include <xc.h>
#include "AS3935.h"
#include "LCD.h"
#include <stdio.h>
#include "timer.h"
#include <stdint.h>

void initSerial(void);

void main(void) {
    char c;
    unsigned long lastDisturber, lastNFChange;
    uint8_t nf, wdth, srej;
    int dist;
    OSCTUNEbits.PLLEN = 1;
    RCONbits.IPEN = 1;
    LCDInit();
    lprintf(0, "AS3935");
    initSerial();
    initMillisecondTimer();
    printf("AS3935 starting\r\n");
    c = initAS3935();
    if (c) {
        printf("AS3935 initialized\r\n");
        printf("Antenna Frequency = %ld\r\n", getAntennaFrequency());
    } else {
        printf("Initialization failed\r\n");
        printf("Antenna Frequency = %ld\r\n", getAntennaFrequency());
        while (1);
    }
    setAFEGain(AFE_INDOOR);
    startMillisecondTimer(1);
    INTCONbits.GIEH = 1;
    INTCONbits.GIEL = 1;
    lastDisturber = getSystemTime();
    while (1) {
        if (doInterrupt) {
            doInterrupt = 0;
            __delay_ms(2);
            switch (readInterruptSource()) {
                case INT_NH:
                    lastNFChange = getSystemTime();
                    nf = readNoiseFloorLevel();
                    if (nf < MAX_NF_LEV) {
                        setNoiseFloorLevel(nf + 1);
                        printf("Noise floor set to %d\r\n", nf + 1);
                    } else {
                        printf("Noise floor at max\r\n");
                        wdth = readWatchdogThreshold();
                        if (wdth < MAX_WDTH) {
                            setWatchdogThreshold(wdth + 1);
                            printf(" WDTH set to %d\r\n", wdth + 1);
                        } else {
                            printf(" WDTH at max\r\n");
                        }
                    }
                    break;
                case INT_D:
                    lastDisturber = getSystemTime();
                    printf("Disturber detected");
                    wdth = readWatchdogThreshold();
                    srej = readSpikeRejection();
                    if (wdth <= srej) {
                        if (wdth < MAX_WDTH) {
                            setWatchdogThreshold(wdth + 1);
                            printf(" WDTH set to %d\r\n", wdth + 1);
                        } else {
                            printf(" WDTH at max\r\n");
                        }
                    } else {
                        if (srej < MAX_SREJ) {
                            setSpikeRejection(srej + 1);
                            printf(" SREJ set to %d\r\n", srej + 1);
                        } else {
                            printf(" SREJ at max\r\n");
                        }
                    }
                    break;
                case INT_L:
                    dist = readDistance();
                    printf("Lightning detected. Storm at %d km\r\n", dist);
                    break;
                case INT_DIST:
                    dist = readDistance();
                    printf("Update: Storm at %d km\r\n", dist);
                    break;
            }
        }
        unsigned long currentTime = getSystemTime();
        if (currentTime - lastNFChange > 5000) {
            lastNFChange = currentTime;
            nf = readNoiseFloorLevel();
            if (nf != 0) {
                setNoiseFloorLevel(nf - 1);
                printf("Noise floor set to %d\r\n", nf - 1);
            } 
        }
        if (currentTime - lastDisturber > 60000) {
            lastDisturber = currentTime;
            wdth = readWatchdogThreshold();
            srej = readSpikeRejection();
            if (wdth > srej) {
                if (wdth != 0) {
                    setWatchdogThreshold(wdth - 1);
                    printf(" WDTH set to %d\r\n", wdth - 1);
                } 
            } else {
                if (srej != 0) {
                    setSpikeRejection(srej - 1);
                    printf(" SREJ set to %d\r\n", srej - 1);
                } 
            }
        }
    }
}

void __interrupt(high_priority) highISR(void) {
    if (INTCON3bits.INT1IF) {
        processInterrupt();
        INTCON3bits.INT1IF = 0;
    }
}

void __interrupt(low_priority) lowISR(void) {
    if (PIR3bits.TMR4IF) {
        processTimerInterrupt();
        PIR3bits.TMR4IF = 0;
    }
}

void initSerial(void) {
    SPBRG1 = 68; //115200
    SPBRGH1 = 68 >> 8;
    TXSTA1bits.BRGH = 1;
    BAUDCON1bits.BRG16 = 1;
    TXSTA1bits.SYNC = 0;
    RCSTA1bits.SPEN = 1;
    TXSTA1bits.TXEN = 1;
}

void putch(char c) {
    while (TX1IF == 0);
    TXREG1 = c;
}