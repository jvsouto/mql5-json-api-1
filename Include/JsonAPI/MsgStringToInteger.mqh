//+------------------------------------------------------------------+
//|                                              StringToInteger.mqh |
//|                                               R. Martín Parrondo |
//|                        https://github.com/parrondo/MQL5-JSON-API |
//+------------------------------------------------------------------+
#property copyright "R. Martín Parrondo"
#property link      "https://github.com/parrondo/MQL5-JSON-API"
#property version   "1.00"

#include <Arrays\ArrayString.mqh>

//+------------------------------------------------------------------+
// Mapping of the message strings into integer type to manage messages.
//+------------------------------------------------------------------+

// Actions command from the client side. To Add new actions on the bottom!

#define _ACCOUNT     0
#define _BALANCE     1
#define _POSITIONS   2
#define _ORDERS      3
#define _HISTORY     4
#define _TRADE       5

// Array to convert into more convenient CArrayString class. To Add new actions on the RIGHT side!
const string allActions[] =
  {
   "ACCOUNT",
   "BALANCE",
   "POSITIONS",
   "ORDERS",
   "HISTORY",
   "TRADE",
  };
// CArrayString class to manage <action> from client message
CArrayString *actions=new CArrayString;
//
//+------------------------------------------------------------------+
//

// Action Types sub-command from the client side. To Add new actions on the bottom!
#define _DATA                    0
#define _TRADES                  1
#define _ORDER_TYPE_BUY          2
#define _ORDER_TYPE_SELL         3
#define _ORDER_TYPE_BUY_LIMIT    4
#define _ORDER_TYPE_SELL_LIMIT   5
#define _ORDER_TYPE_BUY_STOP     6
#define _ORDER_TYPE_SELL_STOP    7
#define _POSITION_MODIFY         8
#define _POSITION_PARTIAL        9
#define _POSITION_CLOSE_ID      10
#define _POSITION_CLOSE_SYMBOL  11
#define _ORDER_MODIFY           12
#define _ORDER_CANCEL           13

// Array to convert into more convenient CArrayString class. To Add new action types on the RIGHT side!
const string allActionTypes[] =
  {
   "DATA",
   "TRADES",
   "ORDER_TYPE_BUY",
   "ORDER_TYPE_SELL",
   "ORDER_TYPE_BUY_LIMIT",
   "ORDER_TYPE_SELL_LIMIT",
   "ORDER_TYPE_BUY_STOP",
   "ORDER_TYPE_SELL_STOP",
   "POSITION_MODIFY",
   "POSITION_PARTIAL",
   "POSITION_CLOSE_ID",
   "POSITION_CLOSE_SYMBOL",
   "ORDER_MODIFY",
   "ORDER_CANCEL"
  };
// CArrayString class to manage <actionType> from client message
CArrayString *actionTypes=new CArrayString;
//
//+------------------------------------------------------------------+
//

// Time frame from the client side. To Add new time frame on the bottom!
#define _M1    0
#define _M2    1
#define _M3    2
#define _M4    3
#define _M5    4
#define _M6    5
#define _M10   6
#define _M12   7
#define _M15   8
#define _M20   9
#define _M30  10
#define _H1   11
#define _H2   12
#define _H3   13
#define _H4   14
#define _H6   15
#define _H8   16
#define _H12  17
#define _D1   18
#define _W1   19
#define _MN1  20
// Array to convert into more convenient CArrayString class. To Add new time frame on the RIGHT side!
const string allTimeFrames[] =
  {
   "M1",
   "M2",
   "M3",
   "M4",
   "M5",
   "M6",
   "M10",
   "M12",
   "M15",
   "M20",
   "M30",
   "H1",
   "H2",
   "H3",
   "H4",
   "H6",
   "H8",
   "H12",
   "D1",
   "W1",
   "MN1"
  };
// CArrayString class to manage <time frame> from client message
CArrayString *timeFrames=new CArrayString;
//+------------------------------------------------------------------+
//| Class to map message strings into integers to use switch-case    |
//+------------------------------------------------------------------+
class MsgStringToInteger
  {
private:

public:
   // Constructor, deconstructor
                     MsgStringToInteger();
                    ~MsgStringToInteger();

   // Methods
   static void              InitializeCArrayString();
   static void              deleteCArrayString();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
MsgStringToInteger::MsgStringToInteger()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
MsgStringToInteger::~MsgStringToInteger()
  {
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Initialization of CArrayString to process string commands          |
//+------------------------------------------------------------------+
void MsgStringToInteger::InitializeCArrayString()
  {

//-- Assign client actions in order to process them.
   for(int i = 0; i < ArraySize(allActions); i++)
     {
      //Print("i ", i, ", allActions[",i,"] ,", allActions[i], " actions[",i,"] ,", actions[i]);
      actions.Insert(allActions[i],i);
     }
//-- Assign client action types in order to process them.
   for(int i = 0; i < ArraySize(allActionTypes); i++)
     {
      //Print("i ", i, ", allActionTypes[",i,"] ,", allActionTypes[i]);
      actionTypes.Insert(allActionTypes[i],i);
     }
//-- Assign client time frame in order to process them.
   for(int i = 0; i < ArraySize(allTimeFrames); i++)
     {
      //Print("i ", i, ", allTimeFrames[",i,"] ,", allTimeFrames[i]);
      timeFrames.Insert(allTimeFrames[i],i);
     }
  }
//+------------------------------------------------------------------+
//| Delete all CArrayString
//+------------------------------------------------------------------+
void MsgStringToInteger::deleteCArrayString()
  {
   delete actions;
   delete actionTypes;
   delete timeFrames;
  }
//+------------------------------------------------------------------+
