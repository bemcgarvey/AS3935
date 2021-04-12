/* 
 * File:   AS3935.h
 * Author: bemcg
 *
 * Created on April 12, 2021, 1:25 PM
 */

#ifndef AS3935_H
#define	AS3935_H

//define one of the following to set communication mode.
#define COM_MODE_I2C
//#define COM_MODE_SPI

#ifdef COM_MODE_I2C
//RD5 = SDA, RD6 = SCL
#define I2C_ADDRESS     0x01
#endif

void initAS3935(void);
unsigned char readRegister(char reg);  //TODO make these private after testing
void writeRegister(char reg, char value);

#endif	/* AS3935_H */

