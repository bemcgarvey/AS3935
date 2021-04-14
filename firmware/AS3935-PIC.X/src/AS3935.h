
#ifndef AS3935_H
#define	AS3935_H

#include <stdint.h>

#define _XTAL_FREQ 32000000L

typedef enum {
    POWER_DOWN = 1, POWER_ACTIVE = 0
} powerMode;

typedef enum {
    AFE_INDOOR = 0b10010, AFE_OUTDOOR = 0b01110
} afeGain;

typedef enum {
    MIN_1 = 0, MIN_5 = 1, MIN_9 = 2, MIN_16 = 3
} minStrikes;

typedef enum {
    INT_NH = 0b0001, INT_D = 0b0100, INT_L = 0b1000, INT_DIST = 0b0000
} interruptSource;

enum {MAX_NF_LEV = 7, MAX_WDTH = 15, MAX_SREJ = 15};

extern char doInterrupt;

char initAS3935(void);
char tuneAntenna(void);
char calibrateOscillators(void);
void setPower(powerMode m);
powerMode readPower(void);
void setAFEGain(afeGain gain);
afeGain readAFEGain(void);
void clearStats(void);
void setNoiseFloorLevel(uint8_t level);
uint8_t readNoiseFloorLevel(void);
void setWatchdogThreshold(uint8_t threshold);
uint8_t readWatchdogThreshold(void);
uint8_t readDistance(void);
void processInterrupt(void);
void setMinStrikes(minStrikes strikes);
minStrikes readMinStrikes(void);
void setMaskDisturber(char mask);
char readMaskDisturber(void);
void setSpikeRejection(uint8_t sr);
uint8_t readSpikeRejection(void);
interruptSource readInterruptSource(void);

#endif	/* AS3935_H */

