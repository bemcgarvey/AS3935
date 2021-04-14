#include <xc.h>
#include "timer.h"

unsigned long systemTime = 0;

void initMillisecondTimer(void) {
    T4CONbits.TMR4ON = 0;
    T4CONbits.T4CKPS = 0b10; //1:16
    T4CONbits.T4OUTPS = 9; //1:10
    PR4 = 50;  //1 ms
    TMR4 = 0;
    PIR3bits.TMR4IF = 0;
    PIE3bits.TMR4IE = 1;
    IPR3bits.TMR4IP = 0;  //low priority
    T4CONbits.TMR4ON = 1;
}

void processTimerInterrupt(void) {
    ++systemTime;
    if (systemTime % 1000 == 0) {
        LATDbits.LATD0 ^= 1;
    }
}