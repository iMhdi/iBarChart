# iBarChart
[![Version](https://img.shields.io/cocoapods/v/iBarChart.svg?style=flat)](http://cocoapods.org/pods/iBarChart)
[![License](https://img.shields.io/cocoapods/l/iBarChart.svg?style=flat)](http://cocoapods.org/pods/iBarChart)
[![Platform](https://img.shields.io/cocoapods/p/iBarChart.svg?style=flat)](http://cocoapods.org/pods/iBarChart)

## Preview
![Alt text](example-app-preview.png?raw=true "")

## Author
El Mahdi BOUKHRIS, m.boukhris@gmail.com

## About
iBarChart is a simple, fully customizable and animated vertical bar chart component that lets you draw graph representing your data type on the X axis and a percentage on the Y axis.

## Example Project
The included example project provides a demonstration of iBarChart. It displays a bar graph and gives the ability to interact with the bars using a delegate method.

## Installation
This project is available via CocoaPods. In order to install, simply add `"iBarChart"` to your Podfile. 

## Working with iBarChart

### iChartView
**iBarChart** is very easy to use, you first have to start by creating the **iChartView** view that would hold your graph (either by code or via Interface builder and linking the outlet). 

The second thing you'll have to do is prepare your data, for that **iBarChart** comes with a data model called **BarData** that holds the infos for each Bar in your Graph (*x Axis label*, *value* and *bar color*). You can instanciate a **BarData** object by calling one of 2 init methods :
1. \- (id) initWithValue:(int) value forLabel:(NSString*) label withColor:(UIColor*) color;
2. \- (id) initWithValue:(int) value forLabel:(NSString*) label;
You either set a color for each Bar or you don't, and you can mix and match if you choose. *BarData* objects that do not set the color attribute will be assigned a color automatically depending on their value :
* [0, 40]             = RED'ish : [UIColor colorWithRed:251.0/255.0 green:0.0/255.0 blue:6.0/255.0 alpha:1.0]
* [40, 70]           = YELLOW'ish : [UIColor colorWithRed:253.0/255.0 green:149.0/255.0 blue:10.0/255.0 alpha:1.0]
* [70, 100]         = GREEN'ish : [UIColor colorWithRed:15.0/255.0 green:113.0/255.0 blue:1.0/255.0 alpha:1.0]

Once your view is in place and your **iChartView** instance ready, make an array with your *BarData* Objects and use one of 2 methods to draw your graph :

1. \- (void) drawChartForPercentages:(NSMutableArray*) data;
    * The **value** attibute of each of your BarData Object must be an *int* ]0, 100]
2. \- (void) drawChartForValues:(NSMutableArray*) data withMaxValue:(long) maxValue;
    * **maxValue** would represent 100% and the **value** attibute of each of your BarData Object must be an *int* ]0, maxValue]
    
### iBarSelectionDelegate
**iChartView** defines a selection delegate called **iBarSelectionDelegate**. 
To get a ballback if/when your the user interacts with your graph make your Class implement the iBarSelectionDelegate protocol :

1. \- (void) didSelectBarAtIndex:(int) index WithData:(BarData*) data;
    * Called when a Bar is clicked and gives the selected index along with the BarData object responsable of drawing the selected graph bar. 
2. \- (void) didClearSelection;
    * Called when no bar is selected, tipically when user selects a bar highlighting it and then reselects the same bar unhighlighting it.

## Donation
If this project helped you, buy me coffee :coffee:

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://paypal.me/BEMahdi)
