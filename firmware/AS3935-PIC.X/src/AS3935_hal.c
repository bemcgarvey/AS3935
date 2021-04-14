#include <xc.h>
#include "AS3935_hal.h"

#ifdef COM_MODE_SPI
unsigned char spiTransfer(char b);
#endif

void initAS3935Hal(void) {
#ifdef COM_MODE_I2C
    TRISDbits.TRISD5 = 1; //RD5 and RD6 both inputs 
    TRISDbits.TRISD6 = 1;
    SSP2ADD = 19; //400kHz
    SSP2STATbits.SMP = 0;
    SSP2CON1bits.SSPM = 0b1000;
    SSP2CON1bits.SSPEN = 1;
#endif
#ifdef COM_MODE_SPI
    CS = 1;
    TRISDbits.TRISD7 = 0;
    TRISDbits.TRISD6 = 0;
    TRISDbits.TRISD5 = 1;
    TRISDbits.TRISD4 = 0;
    SSP2STATbits.CKE = 0;
    SSP2CON1bits.CKP = 0; //SPI mode 0,1
    SSP2CON1bits.SSPM = 0b0001; //FOSC/16 = 2 MHz
    SSP2CON1bits.SSPEN = 1;
    PIR3bits.SSP2IF = 0;
#endif
}

unsigned char readRegister(char reg) {
    unsigned char rx;
#ifdef COM_MODE_I2C
    SSP2CON2bits.SEN = 1;
    while (SSP2CON2bits.SEN == 1);
    SSP2BUF = I2C_ADDRESS << 1;
    while (SSP2STATbits.BF || SSP2STATbits.R_W);
    SSP2BUF = reg;
    while (SSP2STATbits.BF || SSP2STATbits.R_W);
    SSP2CON2bits.RSEN = 1;
    while (SSP2CON2bits.RSEN == 1);
    SSP2BUF = (I2C_ADDRESS << 1) | 1;
    while (SSP2STATbits.BF || SSP2STATbits.R_W);
    SSP2CON2bits.RCEN = 1;
    while (!SSP2STATbits.BF);
    rx = SSP2BUF;
    SSP2CON2bits.ACKDT = 1;
    SSP2CON2bits.ACKEN = 1;
    while (SSP2CON2bits.ACKEN != 0);
    SSP2CON2bits.PEN = 1;
    while (SSP2CON2bits.PEN == 1);
#endif
#ifdef COM_MODE_SPI
    CS = 0;
    spiTransfer(0b01000000 + reg);
    rx = spiTransfer(0);
    CS = 1;
#endif
    return rx;
}

void writeRegister(char reg, char value) {
#ifdef COM_MODE_I2C
    SSP2CON2bits.SEN = 1;
    while (SSP2CON2bits.SEN == 1);
    SSP2BUF = I2C_ADDRESS << 1;
    while (SSP2STATbits.BF || SSP2STATbits.R_W);
    SSP2BUF = reg;
    while (SSP2STATbits.BF || SSP2STATbits.R_W);
    SSP2BUF = value;
    while (SSP2STATbits.BF || SSP2STATbits.R_W);
    SSP2CON2bits.PEN = 1;
    while (SSP2CON2bits.PEN == 1);
#endif
#ifdef COM_MODE_SPI
    CS = 0;
    spiTransfer(reg & 0b00111111);
    spiTransfer(value);
    CS = 1;
#endif   
}

#ifdef COM_MODE_SPI
unsigned char spiTransfer(char b) {
    unsigned char r;
    SSP2BUF = b;
    while (!PIR3bits.SSP2IF);
    PIR3bits.SSP2IF = 0;
    r = SSP2BUF;
    return r;
}
#endif