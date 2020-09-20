//
//  StocksCellsDataSource.swift
//  TradernetApiTest
//
//  Created by Oleg Fedjakin on 20.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import UIKit
import SDWebImage

/// DataSource for Stocks table
class StocksCellsDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewCell = StockTableViewCell(style: .default, reuseIdentifier: kStockTableViewCellIdentifier)
        
        viewCell.tickerIDLabel.text = "ticker"
        viewCell.logoImageView.sd_setImage(with: URL(string: "https://tradernet.ru/logos/get-logo-by-ticker?ticker=hydr"), completed: nil)
        
        return viewCell
    }
}
