//
//  TickerChangesStruct.swift
//  TradernetApiTest
//
//  Created by Oleg Fedjakin on 19.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import Foundation

/// Struct for define Ticker's information about changes
class TickerChanges {
    
    /// Ticker ID
    let c: String
    
    /// Percentage change relative to the closing price of the previous trading session
    let pcp: NSNumber
    
    /// Last trade exchange
    let ltr: String
    
    /// Stock's Name
    let name: String
    
    /// Last trade price
    let ltp: NSNumber
    
    /// Change in the price of the last deal in points relative to the closing price of the previous trading session
    let chg: NSNumber
    
    /// custom initialiser with
    init(tickerDataDictionary: Dictionary<String, Any>) {
        self.c = (tickerDataDictionary["c"] ?? "") as! String
        self.pcp = (tickerDataDictionary["pcp"] ?? 0) as! NSNumber
        self.ltr = (tickerDataDictionary["ltr"] ?? "") as! String
        self.name = (tickerDataDictionary["name"] ?? "") as! String
        self.ltp = (tickerDataDictionary["ltp"] ?? 0) as! NSNumber
        self.chg = (tickerDataDictionary["chg"] ?? 0) as! NSNumber
    }
}
