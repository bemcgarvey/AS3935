#include <xc.h>
#include "timer.h"

unsigned long systemTime = 0;

void initMillisecondTimer(void) {
    T4CONbits.TMR4ON = 0;
    T4CONbits.T4CKPS = 0b10; //1:16
    T4CONbits.T4OUTPS = 9; //1:10
    PR4 = 49; //1 ms  //TODO Adjust for actual device
    TMR4 = 0;
    PIR3bits.TMR4IF = 0;
    PIE3bits.TMR4IE = 1;
    IPR3bits.TMR4IP = 0; //low priority
}

void processTimerInterrupt(void) {
    ++systemTime;
    LATDbits.LATD0 ^= 1;
}

void startMillisecondTimer(char start) {
    if (start) {
        T4CONbits.TMR4ON = 1;
    } else {
        T4CONbits.TMR4ON = 0;
        TMR4 = 0;
    }
}

unsigned long getSystemTime(void) {
    unsigned long currentTime;
    INTCONbits.GIEL = 0;
    currentTime = systemTime;
    INTCONbits.GIEL = 1;
    return currentTime;
}