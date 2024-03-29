EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "AS3935 Lightning Detector"
Date "2020-03-12"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L AS3935-rescue:MA5532-AEB-SamacSys_Parts ANT1
U 1 1 5E6A8392
P 2450 3850
F 0 "ANT1" H 2742 3485 50  0000 C CNN
F 1 "MA5532-AEB" H 2742 3576 50  0000 C CNN
F 2 "SamacSys_Parts:MA5532" H 3100 3950 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/MA5532-AEB.pdf" H 3100 3850 50  0001 L CNN
F 4 "RFID Transponders" H 3100 3750 50  0001 L CNN "Description"
F 5 "" H 3100 3650 50  0001 L CNN "Height"
F 6 "994-MA5532-AE" H 3100 3550 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=994-MA5532-AE" H 3100 3450 50  0001 L CNN "Mouser Price/Stock"
F 8 "COILCRAFT" H 3100 3350 50  0001 L CNN "Manufacturer_Name"
F 9 "MA5532-AEB" H 3100 3250 50  0001 L CNN "Manufacturer_Part_Number"
	1    2450 3850
	-1   0    0    1   
$EndComp
$Comp
L AS3935-rescue:AS3935-BQFT-SamacSys_Parts IC1
U 1 1 5E6A9DD2
P 5000 3700
F 0 "IC1" H 5450 4000 50  0000 L CNN
F 1 "AS3935-BQFT" H 5500 3850 50  0000 L CNN
F 2 "SamacSys_Parts:QFN65P400X400X80-17N" H 6250 4400 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/AS3935-BQFT.pdf" H 6250 4300 50  0001 L CNN
F 4 "Interface - Specialized Franklin Lightning Sensor IC" H 6250 4200 50  0001 L CNN "Description"
F 5 "0.8" H 6250 4100 50  0001 L CNN "Height"
F 6 "985-AS3935-BQFT" H 6250 4000 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=985-AS3935-BQFT" H 6250 3900 50  0001 L CNN "Mouser Price/Stock"
F 8 "ams" H 6250 3800 50  0001 L CNN "Manufacturer_Name"
F 9 "AS3935-BQFT" H 6250 3700 50  0001 L CNN "Manufacturer_Part_Number"
	1    5000 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5E6AACFC
P 5850 5750
F 0 "C5" H 5965 5796 50  0000 L CNN
F 1 "1 uF" H 5965 5705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5888 5600 50  0001 C CNN
F 3 "~" H 5850 5750 50  0001 C CNN
	1    5850 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5E6AB41A
P 2650 2000
F 0 "C1" H 2765 2046 50  0000 L CNN
F 1 "1 uF" H 2765 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2688 1850 50  0001 C CNN
F 3 "~" H 2650 2000 50  0001 C CNN
	1    2650 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5E6ABB53
P 2950 3800
F 0 "C2" H 3065 3846 50  0000 L CNN
F 1 "270 pF" H 3065 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2988 3650 50  0001 C CNN
F 3 "~" H 2950 3800 50  0001 C CNN
	1    2950 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5E6AC0E6
P 3650 3800
F 0 "C3" H 3765 3846 50  0000 L CNN
F 1 "680 pF" H 3765 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3688 3650 50  0001 C CNN
F 3 "~" H 3650 3800 50  0001 C CNN
	1    3650 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E6AC4C7
P 4200 3800
F 0 "R1" H 4270 3846 50  0000 L CNN
F 1 "10 K" H 4270 3755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4130 3800 50  0001 C CNN
F 3 "~" H 4200 3800 50  0001 C CNN
	1    4200 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5E6AC706
P 4500 3200
F 0 "C4" V 4752 3200 50  0000 C CNN
F 1 "10 uF" V 4661 3200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4538 3050 50  0001 C CNN
F 3 "~" H 4500 3200 50  0001 C CNN
	1    4500 3200
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 5E6ACC92
P 7150 2500
F 0 "R2" H 7220 2546 50  0000 L CNN
F 1 "10 K" H 7220 2455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7080 2500 50  0001 C CNN
F 3 "~" H 7150 2500 50  0001 C CNN
	1    7150 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5E6AD29C
P 4150 3250
F 0 "#PWR04" H 4150 3000 50  0001 C CNN
F 1 "GND" H 4155 3077 50  0000 C CNN
F 2 "" H 4150 3250 50  0001 C CNN
F 3 "" H 4150 3250 50  0001 C CNN
	1    4150 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5E6AD7D0
P 4850 4200
F 0 "#PWR07" H 4850 3950 50  0001 C CNN
F 1 "GND" H 4855 4027 50  0000 C CNN
F 2 "" H 4850 4200 50  0001 C CNN
F 3 "" H 4850 4200 50  0001 C CNN
	1    4850 4200
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR06
U 1 1 5E6B048E
P 4800 5350
F 0 "#PWR06" H 4800 5200 50  0001 C CNN
F 1 "VDD" H 4817 5523 50  0000 C CNN
F 2 "" H 4800 5350 50  0001 C CNN
F 3 "" H 4800 5350 50  0001 C CNN
	1    4800 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3800 4650 3550
Wire Wire Line
	2600 3550 2600 3750
Wire Wire Line
	2600 3750 2450 3750
Wire Wire Line
	2950 3650 2950 3550
Connection ~ 2950 3550
Wire Wire Line
	2950 3550 2600 3550
Wire Wire Line
	3650 3650 3650 3550
Connection ~ 3650 3550
Wire Wire Line
	3650 3550 2950 3550
Wire Wire Line
	4200 3650 4200 3550
Connection ~ 4200 3550
Wire Wire Line
	4200 3550 3650 3550
Wire Wire Line
	4650 3800 5000 3800
Wire Wire Line
	5000 3900 4650 3900
Wire Wire Line
	4650 3900 4650 4100
Wire Wire Line
	2600 4100 2600 3850
Wire Wire Line
	2600 3850 2450 3850
Wire Wire Line
	2950 3950 2950 4100
Wire Wire Line
	2600 4100 2950 4100
Connection ~ 2950 4100
Wire Wire Line
	2950 4100 3650 4100
Wire Wire Line
	3650 3950 3650 4100
Connection ~ 3650 4100
Wire Wire Line
	3650 4100 4200 4100
Wire Wire Line
	4200 3950 4200 4100
Connection ~ 4200 4100
Wire Wire Line
	4200 4100 4650 4100
Wire Wire Line
	5000 3700 5000 3200
Wire Wire Line
	5000 3200 4650 3200
Wire Wire Line
	5000 4000 4850 4000
Wire Wire Line
	4850 4000 4850 4200
Wire Wire Line
	4350 3200 4150 3200
Wire Wire Line
	4150 3200 4150 3250
$Comp
L power:GND #PWR05
U 1 1 5E6B55F5
P 4800 3550
F 0 "#PWR05" H 4800 3300 50  0001 C CNN
F 1 "GND" H 4805 3377 50  0000 C CNN
F 2 "" H 4800 3550 50  0001 C CNN
F 3 "" H 4800 3550 50  0001 C CNN
	1    4800 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5550 4800 5550
Wire Wire Line
	4800 5550 4800 5350
Wire Wire Line
	5500 4800 5500 5200
Wire Wire Line
	5700 4800 5700 5200
Wire Wire Line
	5700 5200 5500 5200
Connection ~ 5500 5200
Wire Wire Line
	5500 5200 5500 5550
Wire Wire Line
	5600 4800 5600 5350
Wire Wire Line
	5600 5350 5850 5350
$Comp
L power:GND #PWR010
U 1 1 5E6BA330
P 5850 6000
F 0 "#PWR010" H 5850 5750 50  0001 C CNN
F 1 "GND" H 5855 5827 50  0000 C CNN
F 2 "" H 5850 6000 50  0001 C CNN
F 3 "" H 5850 6000 50  0001 C CNN
	1    5850 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 5900 5850 6000
Wire Wire Line
	4200 3550 4650 3550
Wire Wire Line
	4800 3550 4650 3550
Connection ~ 4650 3550
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5E6BC638
P 2100 1650
F 0 "J1" H 2208 1831 50  0000 C CNN
F 1 "Power" H 2400 1750 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2100 1650 50  0001 C CNN
F 3 "~" H 2100 1650 50  0001 C CNN
	1    2100 1650
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR02
U 1 1 5E6BE834
P 2650 1350
F 0 "#PWR02" H 2650 1200 50  0001 C CNN
F 1 "VDD" H 2667 1523 50  0000 C CNN
F 2 "" H 2650 1350 50  0001 C CNN
F 3 "" H 2650 1350 50  0001 C CNN
	1    2650 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1650 2650 1650
Wire Wire Line
	2650 1650 2650 1350
$Comp
L power:GND #PWR01
U 1 1 5E6BF83B
P 2300 2000
F 0 "#PWR01" H 2300 1750 50  0001 C CNN
F 1 "GND" H 2305 1827 50  0000 C CNN
F 2 "" H 2300 2000 50  0001 C CNN
F 3 "" H 2300 2000 50  0001 C CNN
	1    2300 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5E6C29EF
P 2650 2300
F 0 "#PWR03" H 2650 2050 50  0001 C CNN
F 1 "GND" H 2655 2127 50  0000 C CNN
F 2 "" H 2650 2300 50  0001 C CNN
F 3 "" H 2650 2300 50  0001 C CNN
	1    2650 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2000 2300 1750
Wire Wire Line
	2650 1850 2650 1650
Connection ~ 2650 1650
Wire Wire Line
	2650 2150 2650 2300
$Comp
L Connector:Conn_01x05_Male J7
U 1 1 5E6C4A97
P 9100 3700
F 0 "J7" H 9150 3400 50  0000 R CNN
F 1 "Conn_01x05_Male" H 9072 3723 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 9100 3700 50  0001 C CNN
F 3 "~" H 9100 3700 50  0001 C CNN
	1    9100 3700
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 5E6CA84C
P 7500 1950
F 0 "J6" H 7472 1878 50  0000 R CNN
F 1 "Conn_01x02_Male" H 7608 2040 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7500 1950 50  0001 C CNN
F 3 "~" H 7500 1950 50  0001 C CNN
	1    7500 1950
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5E6CB018
P 5150 1900
F 0 "J2" H 5100 1700 50  0000 C CNN
F 1 "A1" H 5100 2100 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5150 1900 50  0001 C CNN
F 3 "~" H 5150 1900 50  0001 C CNN
	1    5150 1900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 5E6CB6A7
P 6150 1900
F 0 "J3" H 6100 1700 50  0000 C CNN
F 1 "A0" H 6100 2100 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6150 1900 50  0001 C CNN
F 3 "~" H 6150 1900 50  0001 C CNN
	1    6150 1900
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 5E6CC1D0
P 7350 4450
F 0 "J5" H 7400 4700 50  0000 C CNN
F 1 "Conn_01x03_Male" H 7458 4640 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7350 4450 50  0001 C CNN
F 3 "~" H 7350 4450 50  0001 C CNN
	1    7350 4450
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5E6D7917
P 5650 2150
F 0 "#PWR09" H 5650 1900 50  0001 C CNN
F 1 "GND" H 5655 1977 50  0000 C CNN
F 2 "" H 5650 2150 50  0001 C CNN
F 3 "" H 5650 2150 50  0001 C CNN
	1    5650 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2000 5650 2000
Wire Wire Line
	5650 2000 5650 2150
Wire Wire Line
	5950 2000 5650 2000
Connection ~ 5650 2000
Wire Wire Line
	5600 2800 5600 2500
Wire Wire Line
	5600 2500 5450 2500
Wire Wire Line
	5450 2500 5450 1900
Wire Wire Line
	5450 1900 5350 1900
Wire Wire Line
	5700 2800 5700 2500
Wire Wire Line
	5700 2500 5850 2500
Wire Wire Line
	5850 2500 5850 1900
Wire Wire Line
	5850 1900 5950 1900
$Comp
L power:GND #PWR08
U 1 1 5E6DAFC8
P 5050 2750
F 0 "#PWR08" H 5050 2500 50  0001 C CNN
F 1 "GND" H 5055 2577 50  0000 C CNN
F 2 "" H 5050 2750 50  0001 C CNN
F 3 "" H 5050 2750 50  0001 C CNN
	1    5050 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2800 5500 2650
Wire Wire Line
	5500 2650 5050 2650
Wire Wire Line
	5050 2650 5050 2750
Wire Wire Line
	5850 5350 5850 5600
Wire Wire Line
	5350 1800 5350 1300
Wire Wire Line
	5350 1300 5600 1300
Wire Wire Line
	5600 1800 5600 1300
Connection ~ 5600 1300
Wire Wire Line
	5600 1300 5750 1300
Wire Wire Line
	5600 1800 5950 1800
Wire Wire Line
	6050 5350 5850 5350
Connection ~ 5850 5350
Wire Wire Line
	5800 4800 5800 5000
$Comp
L power:GND #PWR011
U 1 1 5E6E7F9E
P 6800 5800
F 0 "#PWR011" H 6800 5550 50  0001 C CNN
F 1 "GND" H 6805 5627 50  0000 C CNN
F 2 "" H 6800 5800 50  0001 C CNN
F 3 "" H 6800 5800 50  0001 C CNN
	1    6800 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4450 6550 4450
Wire Wire Line
	6550 4450 6550 4000
Wire Wire Line
	6550 4000 6400 4000
$Comp
L power:GND #PWR013
U 1 1 5E6FB631
P 7100 4650
F 0 "#PWR013" H 7100 4400 50  0001 C CNN
F 1 "GND" H 7105 4477 50  0000 C CNN
F 2 "" H 7100 4650 50  0001 C CNN
F 3 "" H 7100 4650 50  0001 C CNN
	1    7100 4650
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR012
U 1 1 5E6FBDAF
P 7100 4200
F 0 "#PWR012" H 7100 4050 50  0001 C CNN
F 1 "VDD" H 7117 4373 50  0000 C CNN
F 2 "" H 7100 4200 50  0001 C CNN
F 3 "" H 7100 4200 50  0001 C CNN
	1    7100 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4350 7100 4350
Wire Wire Line
	7100 4350 7100 4200
Wire Wire Line
	7150 4550 7100 4550
Wire Wire Line
	7100 4550 7100 4650
Wire Wire Line
	7650 2800 7650 3500
Wire Wire Line
	7650 3500 8900 3500
Wire Wire Line
	7150 2350 7150 2050
Wire Wire Line
	7150 2050 7300 2050
$Comp
L power:VDD #PWR014
U 1 1 5E7073DA
P 7150 1700
F 0 "#PWR014" H 7150 1550 50  0001 C CNN
F 1 "VDD" H 7167 1873 50  0000 C CNN
F 2 "" H 7150 1700 50  0001 C CNN
F 3 "" H 7150 1700 50  0001 C CNN
	1    7150 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 1950 7150 1950
Wire Wire Line
	7150 1950 7150 1700
Wire Wire Line
	6400 3700 7650 3700
Wire Wire Line
	7650 3700 7650 3600
Wire Wire Line
	7650 3600 8900 3600
Wire Wire Line
	6400 3800 7150 3800
Wire Wire Line
	7900 3800 7900 3700
Wire Wire Line
	7900 3700 8900 3700
Wire Wire Line
	8700 3800 8900 3800
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5E6C9BEA
P 7150 5500
F 0 "J4" H 7122 5428 50  0000 R CNN
F 1 "Conn_01x02_Male" H 7258 5590 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7150 5500 50  0001 C CNN
F 3 "~" H 7150 5500 50  0001 C CNN
	1    7150 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	6600 5000 6600 5400
Wire Wire Line
	6600 5400 6950 5400
Wire Wire Line
	5800 5000 6600 5000
Wire Wire Line
	6950 5500 6800 5500
Wire Wire Line
	6800 5500 6800 5800
Wire Wire Line
	6600 5000 8700 5000
Wire Wire Line
	8700 5000 8700 3800
Connection ~ 6600 5000
Text Notes 1850 1650 0    50   ~ 0
Vdd
Text Notes 1850 1800 0    50   ~ 0
Gnd
Text Notes 4200 1900 0    50   ~ 0
I2C Address selection
Text Notes 7250 1800 0    50   ~ 0
SCL Pull-up enable
Text Notes 7100 5650 0    50   ~ 0
CS ground
Text Notes 7300 4700 0    50   ~ 0
SPI/I2C selection
Text Notes 9250 3500 0    50   ~ 0
SDA/MOSI
Text Notes 9250 3600 0    50   ~ 0
MISO
Text Notes 9250 3700 0    50   ~ 0
SCL/SCK
Text Notes 9250 3800 0    50   ~ 0
CS
Text Notes 9250 3900 0    50   ~ 0
IRQ
Wire Wire Line
	5900 2800 7650 2800
Wire Wire Line
	7150 2650 7150 3800
Connection ~ 7150 3800
Wire Wire Line
	7150 3800 7900 3800
Text Label 6050 5350 0    50   ~ 0
Vreg
Text Label 5750 1300 0    50   ~ 0
Vreg
Text Notes 7450 4550 0    50   ~ 0
SPI
Text Notes 7450 4350 0    50   ~ 0
I2C
$Comp
L Device:R R3
U 1 1 5E6D3B53
P 2150 5650
F 0 "R3" H 2220 5696 50  0000 L CNN
F 1 "150" H 2220 5605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2080 5650 50  0001 C CNN
F 3 "~" H 2150 5650 50  0001 C CNN
	1    2150 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5E6D43DD
P 2150 6100
F 0 "D1" V 2189 5983 50  0000 R CNN
F 1 "LED" V 2098 5983 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Castellated" H 2150 6100 50  0001 C CNN
F 3 "~" H 2150 6100 50  0001 C CNN
	1    2150 6100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5E6D56A6
P 2150 7300
F 0 "#PWR016" H 2150 7050 50  0001 C CNN
F 1 "GND" H 2155 7127 50  0000 C CNN
F 2 "" H 2150 7300 50  0001 C CNN
F 3 "" H 2150 7300 50  0001 C CNN
	1    2150 7300
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002K Q1
U 1 1 5E6DCAE1
P 2050 6600
F 0 "Q1" H 2254 6646 50  0000 L CNN
F 1 "2N7002K" H 2254 6555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2250 6525 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 2050 6600 50  0001 L CNN
	1    2050 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3900 8150 3900
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 5E7111FF
P 2950 5200
F 0 "J8" H 2922 5128 50  0000 R CNN
F 1 "Conn_01x02_Male" H 3058 5290 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2950 5200 50  0001 C CNN
F 3 "~" H 2950 5200 50  0001 C CNN
	1    2950 5200
	-1   0    0    1   
$EndComp
Wire Wire Line
	2150 5500 2150 5200
Wire Wire Line
	2150 5200 2750 5200
Wire Wire Line
	2150 5950 2150 5800
Wire Wire Line
	2150 6400 2150 6250
$Comp
L power:VDD #PWR015
U 1 1 5E726D49
P 2150 4800
F 0 "#PWR015" H 2150 4650 50  0001 C CNN
F 1 "VDD" H 2167 4973 50  0000 C CNN
F 2 "" H 2150 4800 50  0001 C CNN
F 3 "" H 2150 4800 50  0001 C CNN
	1    2150 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5100 2150 5100
Wire Wire Line
	2150 5100 2150 4800
Text Label 1450 6600 0    50   ~ 0
IRQ
Wire Wire Line
	1850 6600 1650 6600
Text Label 8150 4150 0    50   ~ 0
IRQ
Wire Wire Line
	8150 4150 8150 3900
Connection ~ 8150 3900
Wire Wire Line
	8150 3900 8900 3900
Text Notes 2850 5400 0    50   ~ 0
IRQ LED Enable
$Comp
L Device:R R4
U 1 1 5E731451
P 1650 6900
F 0 "R4" H 1720 6946 50  0000 L CNN
F 1 "10 K" H 1720 6855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1580 6900 50  0001 C CNN
F 3 "~" H 1650 6900 50  0001 C CNN
	1    1650 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 6800 2150 7050
Wire Wire Line
	1650 7050 2150 7050
Connection ~ 2150 7050
Wire Wire Line
	2150 7050 2150 7300
Wire Wire Line
	1650 6750 1650 6600
Connection ~ 1650 6600
Wire Wire Line
	1650 6600 1450 6600
Text Notes 2550 4250 0    50   ~ 0
Adjust as C2 needed.  330 pF may be better
$EndSCHEMATC
