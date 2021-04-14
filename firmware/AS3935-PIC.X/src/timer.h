#ifndef TIMER_H
#define	TIMER_H

extern unsigned long systemTime;
void initMillisecondTimer(void);
void processTimerInterrupt(void);
void startMillisecondTimer(char start);

#endif	/* TIMER_H */

