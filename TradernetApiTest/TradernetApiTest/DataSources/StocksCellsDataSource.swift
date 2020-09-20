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
    
    /// property stores stocks array for dataSource
    var stocksStorage: [Stock] = []
    
    override init() {
        super.init()
        initStocksStorage()
    }
    
    // MARK: - Work with stocks storage
    func initStocksStorage() {
        kTickersIDsArray.forEach { [weak self]  (tickerIDString) in
            guard let self = self else { return }
            let stock = Stock(with: tickerIDString)
            self.stocksStorage.append(stock)
        }
    }
    
    func changeStock(with tickerChanges: TickerChanges) {
        debugPrint(tickerChanges)
        guard let changedStockIndex = indexOfStock(withTickerID: tickerChanges.c) else {
            debugPrint("ERROR: ticker did not exist")
            return
        }
        
        let stock = stocksStorage[changedStockIndex]
        stock.name = tickerChanges.name
        
        debugPrint("DDDEBUG: stocks: \(stocksStorage)")
    }
    
    private func indexOfStock(withTickerID tickerID: String) -> Int? {
        return kTickersIDsArray.firstIndex(where: { $0 == tickerID })
    }
    
    // MARK: - UITableViewDataSource implementation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocksStorage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewCell = StockTableViewCell(style: .default, reuseIdentifier: kStockTableViewCellIdentifier)
        guard indexPath.row < stocksStorage.count else {
            return UITableViewCell(style: .default, reuseIdentifier: "EmptyCell")
        }
        
        let stock = stocksStorage[indexPath.row]
        
        viewCell.logoImageView.sd_setImage(with: stock.logoURL(), completed: nil)
        viewCell.tickerIDLabel.text = stock.c
        viewCell.stockNameLabel.text = stock.name
        
        return viewCell
    }
}
