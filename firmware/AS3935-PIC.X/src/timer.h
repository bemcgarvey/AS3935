#ifndef TIMER_H
#define	TIMER_H

void initMillisecondTimer(void);
void processTimerInterrupt(void);
void startMillisecondTimer(char start);
unsigned long getSystemTime(void);
#endif	/* TIMER_H */

