//+------------------------------------------------------------------+
//|                                        CandleSticks_patterns.mqh |
//|                                                    Miguel Ferraz |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Miguel Ferraz"
#property link      "https://www.mql5.com"
#property strict




//+------------------------------------------------------------------+
//|                                     Pattern Recognition v1.0     |
//|          (complete rewrite and name change of pattern alert)     |
//+------------------------------------------------------------------+
//|                                         Pattern Recognition.mq4  |
//|                                Copyright © 2005, Jason Robinson  |
//|                                  (jasonrobinsonuk,  jnrtrading)  |
//|                                     http://www.jnrtrading.co.uk  |
//|      This is still work in progress and needs LOTS of testing    |
//+------------------------------------------------------------------+

/* -------- Variables to add in your EA --------
extern bool Show_Alert = false;   
extern int shift = 0;
extern ENUM_TIMEFRAMES CSP_timeFrame = PERIOD_M1;
extern bool Use_Bearish_Engulfing = true;
extern bool Use_Three_Outside_Down = true;
extern bool Use_Dark_Cloud_Cover = true;
extern bool Use_Evening_Doji_Stars = true;
extern bool Use_Bearish_Harami = true;
extern bool Use_Three_Inside_Down = true;
extern bool Use_Three_Black_Crows = true;
extern bool Use_Evening_Stars = true;
   
extern bool Use_Bullish_Engulfing = true;
extern bool Use_Three_Outside_Up = true;
extern bool Use_Bullish_Harami = true;
extern bool Use_Three_Inside_Up = true;
extern bool Use_Piercing_Line = true;
extern bool Use_Three_White_Soldiers = true;
extern bool Use_Morning_Doji_Stars = true;
//-----------------------------------------------*/

       
              
bool Bearish_Patterns (string symboll){       // Bearish Patterns 
   
   bool Bearish_Patterns_signal = false; 
    
   double Range, AvgRange;
   int counter, setalert;
   static datetime prevtime = 0;
 

   int shift1;
   int shift2;
   int shift3;
   int shift4;
   int shift5;
   int shift6;
   
   string pattern, period;
   int setPattern = 0;
   int alert = 0;
   double O, O1, O2, C, C1, C2, L, L1, L2, H, H1, H2,  O3, O4, O5, C3, C4, C5, L3, L4, L5, H3, H4, H5; 
   
   // Bearish Patterns    
   bool Bearish_Engulfing = false;
   bool Three_Outside_Down = false;
   bool Dark_Cloud_Cover = false;
   bool Evening_Doji_Stars = false;
   bool Bearish_Harami = false;
   bool Three_Inside_Down = false;
   bool Three_Black_Crows = false;
   bool Evening_Stars = false;
         
      //----
 
       setalert = 0;
       
       shift1 = shift + 1;
       shift2 = shift + 2;
       shift3 = shift + 3;
       shift4 = shift + 4;
       shift5 = shift + 5;
       shift6 = shift + 6;
       
             
       O = iOpen(symboll, CSP_timeFrame, shift1);
       O1 = iOpen(symboll, CSP_timeFrame, shift2);
       O2 = iOpen(symboll, CSP_timeFrame, shift3);
       O3 = iOpen(symboll, CSP_timeFrame, shift4);
       O4 = iOpen(symboll, CSP_timeFrame, shift5);
       O5 = iOpen(symboll, CSP_timeFrame, shift6);
       
       H = iHigh(symboll, CSP_timeFrame, shift1);
       H1 = iHigh(symboll, CSP_timeFrame, shift2);
       H2 = iHigh(symboll, CSP_timeFrame, shift3);
       H3 = iHigh(symboll, CSP_timeFrame, shift4);
       H4 = iHigh(symboll, CSP_timeFrame, shift5);
       H5 = iHigh(symboll, CSP_timeFrame, shift6);
       
       L = iLow(symboll, CSP_timeFrame, shift1);
       L1 = iLow(symboll, CSP_timeFrame, shift2);
       L2 = iLow(symboll, CSP_timeFrame, shift3);
       L3 = iLow(symboll, CSP_timeFrame, shift4);
       L4 = iLow(symboll, CSP_timeFrame, shift5);
       L5 = iLow(symboll, CSP_timeFrame, shift6);
       
       C = iClose(symboll, CSP_timeFrame, shift1);
       C1 = iClose(symboll, CSP_timeFrame, shift2);
       C2 = iClose(symboll, CSP_timeFrame, shift3);  
       C3 = iClose(symboll, CSP_timeFrame, shift4);
       C4 = iClose(symboll, CSP_timeFrame, shift5);
       C5 = iClose(symboll, CSP_timeFrame, shift6);
          
   if( Use_Bearish_Engulfing == true)
       {// Check for Bearish Engulfing pattern
       if( (C1 > O1) && (O > C) && (O >= C1) && (O1 >= C) && ((O - C) > (C1 - O1)) ) 
         {Bearish_Engulfing = true;
          if(setalert == 0 && Show_Alert == true)  
          {pattern = "Bearish Engulfing Pattern";
            setalert = 1;}}}


   if( Use_Three_Outside_Down == true)
       {// Check for a Three Outside Down pattern
       if( (C2 > O2) && (O1 > C1) && (O1 >= C2) && (O2 >= C1) &&
           ((O1 - C1) > (C2 - O2)) && (O > C) && (C < C1) ) 
         {Three_Outside_Down = true; 
         if(setalert == 0 && Show_Alert == true)  
         {pattern = "Three Oustide Down Pattern";
            setalert = 1;}}}
         
         
         
   if( Use_Dark_Cloud_Cover == true)
       {// Check for a Dark Cloud Cover pattern
       if((C1 > O1) && (((C1 + O1) / 2) > C) && (O > C) && 
          (O > C1) && (C > O1) && ((O - C) / (0.001 + (H - L)) > 0.6)) 
         {Dark_Cloud_Cover = true;
          if(setalert == 0 && Show_Alert == true)  
          {pattern = "Dark Cloud Cover Pattern";
            setalert = 1;}}}  
               
               
   if( Use_Evening_Doji_Stars == true)
       {// Check for Evening Doji Star pattern
       if((C2 > O2) && ((C2 - O2) / (0.001 + H2 - L2) > 0.6) && 
          (C2 < O1) && (C1 > O1) && ((H1-L1) > (3*(C1 - O1))) && (O > C) && (O < O1)) 
         {Evening_Doji_Stars = true;
           if(setalert == 0 && Show_Alert == true) 
           {pattern = "Evening Doji Star Pattern";
             setalert = 1;}}}     
       
       
   if( Use_Bearish_Harami == true)
       {// Check for Bearish Harami pattern
       if((C1 > O1) && (O > C) && (O <= C1) && (O1 <= C) && ((O - C) < (C1 - O1))) 
         {Bearish_Harami = true;
          if(shift == 0 && Show_Alert == true)     
          {pattern="Bearish Harami Pattern";
             setalert = 1;}}}
               
               
   if( Use_Three_Inside_Down == true)
       {// Check for Three Inside Down pattern
       if((C2 > O2) && (O1 > C1) && (O1 <= C2) && (O2 <= C1) && 
          ((O1 - C1) < (C2 - O2)) && (O > C) && (C < C1) && (O < O1)) 
         {Three_Inside_Down = true;
          if(shift == 0 && Show_Alert == true)     
          {pattern = "Three Inside Down Pattern";
            setalert = 1;}}}   
              
              
   if( Use_Three_Black_Crows == true)
       {// Check for Three Black Crows pattern
       if((O > C*1.01) && (O1 > C1*1.01) && (O2 > C2*1.01) && (C < C1) && (C1 < C2) && 
          (O > C1) && (O < O1) && (O1 > C2) && (O1 < O2) && (((C - L) / (H - L)) < 0.2) && 
          (((C1 - L1) / (H1 - L1)) < 0.2) && (((C2 - L2) / (H2 - L2)) < 0.2))
         {Three_Black_Crows = true;
          if(shift == 0 && Show_Alert == true)     
          {pattern = "Three Black Crows Pattern";
            setalert = 1;}}}
              
              
   if( Use_Evening_Stars == true)
       {//Check for Evening Star Pattern
       if((C2 > O2) && ((C2 - O2) / (0.001 + H2 - L2) > 0.6) && (C2 < O1) && (C1 > O1) && ((H1 - L1) > (3*(C1 - O1))) && (O > C) && (O < O1)) 
         {Evening_Stars = true;
          if(shift == 0 && Show_Alert == true)     
          {pattern = "Evening Star Pattern";
            setalert = 1;}}}
                                                    
    //   if(setalert == 1 && shift == 0)  {Alert(symboll, " ", period, " ", pattern);
    //                                     setalert = 0;}
                                                    
                                                    
     // End of Bearish Patterns
     
              // Bearish Patterns    
    if( Bearish_Engulfing == true ||
        Three_Outside_Down == true ||
        Dark_Cloud_Cover == true ||
        Evening_Doji_Stars == true ||
        Bearish_Harami == true ||
        Three_Inside_Down == true ||
        Three_Black_Crows == true ||
        Evening_Stars == true          )   Bearish_Patterns_signal = true; 
       
       
      return(Bearish_Patterns_signal);
   }
       
       
       
       
       
       
bool Bullish_Patterns (string symboll){      // Bullish Patterns

   bool Bullish_Patterns_signal = false; 

   double Range, AvgRange;
   int counter, setalert;
   static datetime prevtime = 0;

   int shift1;
   int shift2;
   int shift3;
   int shift4;
   int shift5;
   int shift6;
   
   string pattern, period;
   int setPattern = 0;
   int alert = 0;
   double O, O1, O2, C, C1, C2, L, L1, L2, H, H1, H2,  O3, O4, O5, C3, C4, C5, L3, L4, L5, H3, H4, H5; 
   
          // Bullish Patterns
   bool Bullish_Engulfing = false;
   bool Three_Outside_Up = false;
   bool Bullish_Harami = false;
   bool Three_Inside_Up = false;
   bool Piercing_Line = false;
   bool Three_White_Soldiers = false;
   bool Morning_Doji_Stars = false;
   

       setalert = 0;
         
       shift1 = shift + 1;
       shift2 = shift + 2;
       shift3 = shift + 3;
       shift4 = shift + 4;
       shift5 = shift + 5;
       shift6 = shift + 6;
       
             
       O = iOpen(symboll, CSP_timeFrame, shift1);
       O1 = iOpen(symboll, CSP_timeFrame, shift2);
       O2 = iOpen(symboll, CSP_timeFrame, shift3);
       O3 = iOpen(symboll, CSP_timeFrame, shift4);
       O4 = iOpen(symboll, CSP_timeFrame, shift5);
       O5 = iOpen(symboll, CSP_timeFrame, shift6);
       
       H = iHigh(symboll, CSP_timeFrame, shift1);
       H1 = iHigh(symboll, CSP_timeFrame, shift2);
       H2 = iHigh(symboll, CSP_timeFrame, shift3);
       H3 = iHigh(symboll, CSP_timeFrame, shift4);
       H4 = iHigh(symboll, CSP_timeFrame, shift5);
       H5 = iHigh(symboll, CSP_timeFrame, shift6);
       
       L = iLow(symboll, CSP_timeFrame, shift1);
       L1 = iLow(symboll, CSP_timeFrame, shift2);
       L2 = iLow(symboll, CSP_timeFrame, shift3);
       L3 = iLow(symboll, CSP_timeFrame, shift4);
       L4 = iLow(symboll, CSP_timeFrame, shift5);
       L5 = iLow(symboll, CSP_timeFrame, shift6);
       
       C = iClose(symboll, CSP_timeFrame, shift1);
       C1 = iClose(symboll, CSP_timeFrame, shift2);
       C2 = iClose(symboll, CSP_timeFrame, shift3);  
       C3 = iClose(symboll, CSP_timeFrame, shift4);
       C4 = iClose(symboll, CSP_timeFrame, shift5);
       C5 = iClose(symboll, CSP_timeFrame, shift6);
       

   if( Use_Bullish_Engulfing == true)
       {// Check for Bullish Engulfing pattern
       if((O1 > C1) && (C > O) && (C >= O1) && (C1 >= O) && ((C - O) > (O1 - C1))) 
         {Bullish_Engulfing = true;
           if(shift == 0 && Show_Alert == true) 
             {pattern = "Bullish Engulfing Pattern";
               setalert = 1;}}}
               
   if( Use_Three_Outside_Up == true)
       {// Check for Three Outside Up pattern
       if((O2 > C2) && (C1 > O1) && (C1 >= O2) && (C2 >= O1) && ((C1 - O1) > (O2 - C2)) && 
          (C > O) && (C > C1)) 
         {Three_Outside_Up = true;
           if(shift == 0 && Show_Alert == true) 
             {pattern = "Three Outside Up Pattern";
               setalert = 1;}}}
               
   if( Use_Bullish_Harami == true)
       {// Check for Bullish Harami pattern
       if((O1 > C1) && (C > O) && (C <= O1) && (C1 <= O) && ((C - O) < (O1 - C1))) 
         {Bullish_Harami = true;
           if(shift == 0 && Show_Alert == true) 
             {pattern = "Bullish Harami Pattern";
               setalert = 1;}}}
         
   if( Use_Three_Inside_Up == true)
       {// Check for Three Inside Up pattern
       if((O2 > C2) && (C1 > O1) && (C1 <= O2) && (C2 <= O1) && ((C1 - O1) < (O2 - C2)) && 
          (C > O) && (C > C1) && (O > O1)) 
         {Three_Inside_Up = true;
           if(shift == 0 && Show_Alert == true) 
             {pattern = "Three Inside Up Pattern";
               setalert = 1;}}}
               
   if( Use_Piercing_Line == true)
       {// Check for Piercing Line pattern
       if((C1 < O1) && (((O1 + C1) / 2) < C) && (O < C) && (O < C1) && (C < O1) && 
          ((C - O) / (0.001 + (H - L)) > 0.6)) 
         {Piercing_Line = true;
           if(shift == 0 && Show_Alert == true) 
             {pattern = "Piercing Line Pattern";
               setalert = 1;}}}  
               
   if( Use_Three_White_Soldiers == true)
       {// Check for Three White Soldiers pattern
       if((C > O*1.01) && (C1 > O1*1.01) && (C2 > O2*1.01) && (C > C1) && (C1 > C2) && 
          (O < C1) && (O > O1) && (O1 < C2) && (O1 > O2) && (((H - C) / (H - L)) < 0.2) && 
          (((H1 - C1) / (H1 - L1)) < 0.2) && (((H2 - C2) / (H2 - L2)) < 0.2)) 
         {Three_White_Soldiers = true;
          if(shift == 0 && Show_Alert == true) 
             {pattern = "Three White Soldiers Pattern";
               setalert = 1;}}}    
               
   if( Use_Morning_Doji_Stars == true)
       {// Check for Morning Doji Star
       if((O2 > C2) && ((O2 - C2) / (0.001 + H2 - L2) > 0.6) && (C2 > O1) && (O1 > C1) && 
          ((H1 - L1) > (3*(C1 - O1))) && (C > O) && (O > O1)) 
         {Morning_Doji_Stars = true;
          if(shift == 0 && Show_Alert == true) 
             {pattern = "Morning Doji Star Pattern";
               setalert = 1;}}}
         
         
      //   if(setalert == 1 && shift == 0)   {Alert(symboll, " ", period, " ", pattern);
        //                                    setalert = 0;}
         
         
         // End of Bullish Patterns
         if(Bullish_Engulfing == true ||
            Three_Outside_Up == true ||
            Bullish_Harami == true ||
            Three_Inside_Up == true ||
            Piercing_Line == true ||
            Three_White_Soldiers == true ||
            Morning_Doji_Stars == true       )   { Bullish_Patterns_signal = true;  }
        
        return(Bullish_Patterns_signal);
        
         }
         
         
         


//+------------------------------------------------------------------+









