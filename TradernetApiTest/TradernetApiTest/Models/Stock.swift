//
//  Ticker.swift
//  TradernetApiTest
//
//  Created by Oleg Fedjakin on 19.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import Foundation

/// Struct for define Stock's information
class Stock {
    
    /// Ticker ID
    let c: String
    
    /// Stock's Name
    var name: String = ""
    
    init(with tickerID: String) {
        c = tickerID
    }

    /// URL for stock's logo
    func logoURL() -> URL? {
        return URL(string: "https://tradernet.ru/logos/get-logo-by-ticker?ticker=\(c.lowercased())")
    }
}

extension Stock: CustomStringConvertible {
    var description: String {
        return "c: \(c), name: \(name)"
    }
}
