#include <xc.h>
#include "AS3935.h"
#include "LCD.h"

void initInterface(void);

void initAS3935(void) {
    initInterface();

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

#endif   
}

void initInterface(void) {
#ifdef COM_MODE_I2C
    TRISD = 0b01100000; //MMSP2 uses RD5 as SDA, RD6 as SCL, both set as inputs
    SSP2ADD = 19; //400kHz
    SSP2STATbits.SMP = 0;
    SSP2CON1bits.SSPM = 0b1000; //I2C Master mode
    SSP2CON1bits.SSPEN = 1; //Enable MSSP
#endif
#ifdef COM_MODE_SPI

#endif
}