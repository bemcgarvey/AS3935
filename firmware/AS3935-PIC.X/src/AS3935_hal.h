/* 
 * File:   AS3935.h
 * Author: bemcg
 *
 * Created on April 12, 2021, 1:25 PM
 */

#ifndef AS3935_HAL_H
#define	AS3935_HAL_H

//define one of the following to set communication mode.
//#define COM_MODE_I2C
#define COM_MODE_SPI

#ifdef COM_MODE_I2C
//RD5 = SDA, RD6 = SCL
#define I2C_ADDRESS     0x01
#endif

#ifdef COM_MODE_SPI
//    RD7  <->  CS
//    RD6  <->  SCK
//    RD5  <->  MISO
//    RD4  <->  MOSI/SDA
#define CS  LATDbits.LATD7
#endif

void initAS3935Hal(void);
unsigned char readRegister(char reg);  //TODO make these private after testing
void writeRegister(char reg, char value);

#endif	/* AS3935_HAL_H */

