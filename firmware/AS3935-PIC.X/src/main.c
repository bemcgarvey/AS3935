/*
 * File:   main.c
 * Author: bemcg
 *
 * Created on April 12, 2021, 1:25 PM
 */


#include <xc.h>
#include "AS3935_hal.h"
#include "LCD.h"

void main(void) {
    OSCTUNEbits.PLLEN = 1;
    LCDInit();
    lprintf(0, "AS3935");
    initAS3935Hal();
    char c = readRegister(2);
    lprintf(1, "0x%02x", c);
    c = readRegister(0);
    lprintf(0, "0x%02x", c);
    while (1) {
        
    }
}
