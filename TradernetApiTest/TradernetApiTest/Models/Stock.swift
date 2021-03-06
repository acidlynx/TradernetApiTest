//
//  Ticker.swift
//  TradernetApiTest
//
//  Created by Oleg Fedjakin on 19.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import Foundation

/// Class (for ref-type mapping with cells) for define Stock's information
class Stock {
    
    /// Ticker ID
    let c: String
    
    /// Stock's Name
    var name: String = ""
    
    /// Percentage change relative to the closing price of the previous trading session
    var pcp: NSNumber = 0
    
    /// Type of growing of price (in compare with previous value of property .pcp)
    var growType: ComparisonResult = .orderedSame
    
    /// Last trade exchange
    var ltr: String = ""
        
    /// Last trade price
    var ltp: NSNumber = 0
    
    /// Change in the price of the last deal in points relative to the closing price of the previous trading session
    var chg: NSNumber = 0
    
    init(with tickerID: String) {
        c = tickerID
    }

    /// URL for stock's logo
    func logoURL() -> URL? {
        return URL(string: "https://tradernet.ru/logos/get-logo-by-ticker?ticker=\(c.lowercased())")
    }
    
    /// returns stock name + exchange name
    func exchangeInfo() -> String {
        var returnValue = "\(name)"
        if !ltr.isEmpty {
            returnValue = "\(ltr) | \(name)"
        }
        
        return returnValue
    }
    
    /// returns summary about last trade
    func lastTradeInfo() -> String {
        if ltp == 0 {
            return ""
        }
        
        return "\(ltp) (\(chg))"
    }
}

extension Stock: CustomStringConvertible {
    var description: String {
        return "c: \(c), name: \(name)"
    }
}
