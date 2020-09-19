//
//  Ticker.swift
//  TradernetApiTest
//
//  Created by Oleg Fedjakin on 19.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import Foundation

/// Struct for define Stock's information
struct Stock {
    
    /// Ticker ID
    let c: String
    
    /// Stock's Name
    let name: String

    /// URL for stock's logo
    func logoURL() -> URL? {
        return URL(string: "https://tradernet.ru/logos/get-logo-by-ticker?ticker=\(c.lowercased())")
    }
}
