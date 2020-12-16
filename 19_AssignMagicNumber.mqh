//+-------------------------------------------------------------------+
//|                                          19_AssignMagicNumber.mqh |
//|                                  Copyright 2020, Vladimir Zhbanko |
//+-------------------------------------------------------------------+
#property copyright "Copyright 2020, Vladimir Zhbanko"
#property link      "https://vladdsm.github.io/myblog_attempt/"
#property version   "1.001"  
#property strict
// function to automatically assign magic number to the symbol
// version 1.001 date 18.09.2020

//+-------------------------------------------------------------+//
//Function requires input of the symbol 
//+-------------------------------------------------------------+//
/*
@description: Automatically assign magic number based on the symbol used and main strategy magic number
@purpose: Quicker deploy of the trading robots with predictable order management
@param symbol - string with a symbol
@param magic - int with a 7 digit magic number 
@guide:
1. Use function in the first line of the init function e.g.:  MagicNumber = AssignMagicNumber(Symbol(), MagicNumber);
*/
/*
Magic number codification :
Digit 1 : current year last digit
Digit 2 : type (1= live account ; 2 : demo account ; 3 : contest) 
Digit 3-4 : strategy ID
Digit 5 : Terminal number
Digit 6-7 : Pair ID
*/



int AssignMagicNumber(string symbol, string strat)
{
/*
- 
- 
 
*/
//define internal variables needed
//PAIR
string Core28Pairs[] = {"AUDCAD","AUDCHF","AUDJPY","AUDNZD","AUDUSD","CADCHF","CADJPY","CHFJPY","EURAUD","EURCAD","EURCHF","EURGBP","EURJPY","EURNZD","EURUSD","GBPAUD","GBPCAD","GBPCHF","GBPJPY","GBPNZD","GBPUSD","NZDCAD","NZDCHF","NZDJPY","NZDUSD","USDCAD","USDCHF","USDJPY"};
int result;
string tempString1, digit6_7;

//extract 5 left elements of the magic number
 
tempString1=StringSubstr(tempString1,0,StringLen(tempString1)-2);  //substract 3rd element from right
//Comment(tempString1);
   
for(int i=0;i<ArrayRange(Core28Pairs,0);i++)
  {
   if(symbol == Core28Pairs[i])
     {
      if(i <= 9)
        {
         digit6_7 = StringConcatenate("0"+(string)i); //add zero in front of the number
        } else
            {
             digit6_7 = (string)i;
            }
           
      break;
     }
  }    

//Read the terminal
// create a new csv file for each terminal with the terminal number inside MQL4/file
int handle;
string digit5;
string str;

handle=FileOpen("terminal.csv",FILE_READ);
if(handle==-1)Print("Function Read Prediction: Error - file does not exist"); 
if(FileSize(handle)==0){FileClose(handle); Comment("Error - File is empty"); }
   
   while(!FileIsEnding(handle))
   {
   str=FileReadString(handle);
   digit5 = str;
   }
  



//Strategy
string digit3_4 = strat;


//Account type
ENUM_ACCOUNT_TRADE_MODE account_type=(ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE); 

   string digit2; 
   switch(account_type) 
     { 
      case  ACCOUNT_TRADE_MODE_DEMO: 
         digit2 ="2"; 
         break; 
      case  ACCOUNT_TRADE_MODE_CONTEST: 
         digit2 ="3"; 
         break; 
      default: 
         digit2 ="1"; 
         break; 
     } 
 

//year
int year = Year();
year = year - 2020;
// can delete this condition after 2020
if(year == 0)
   {
   year = 1;
   }
string digit1 = (string)year;


//Comment(tempString2);
result = StrToInteger(StringConcatenate(digit1,digit2, digit3_4,digit5, digit6_7));        //translate to integer
return(result);
 
} 
