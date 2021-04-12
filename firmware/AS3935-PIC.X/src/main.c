/*
 * File:   main.c
 * Author: bemcg
 *
 * Created on April 12, 2021, 1:25 PM
 */


#include <xc.h>
#include "AS3935.h"
#include "LCD.h"

void main(void) {
    OSCTUNEbits.PLLEN = 1;
    LCDInit();
    lprintf(0, "AS3935");
    initAS3935();
    char c = readRegister(1);
    lprintf(0, "0x%02x", c);
    //writeRegister(1, 0x14);
    //c = readRegister(1);
    //lprintf(1, "0x%02x", c);
    while (1) {
        
    }
}
