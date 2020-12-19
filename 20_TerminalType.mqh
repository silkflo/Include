//+------------------------------------------------------------------+
//|                                             20_Terminal_type.mqh |
//|                                         Copyright 2020, Stufflow |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, Stufflow"
#property link      "https://www.mql5.com"
#property strict


string TerminalType()
{
      int handle;
      string terminalNumber;
      string str;
      
      handle=FileOpen("terminal.csv",FILE_READ);
      if(handle==-1)Print("Function Read terminal: Error - file does not exist"); 
      if(FileSize(handle)==0){FileClose(handle); Comment("Error - File is empty"); }
         
         while(!FileIsEnding(handle))
         {
         str=FileReadString(handle);
         terminalNumber = str;
         }
       FileClose(handle);
         return terminalNumber;
}