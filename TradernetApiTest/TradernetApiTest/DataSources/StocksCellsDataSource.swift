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
    var cellsStorage: [StockTableViewCell] = []
    
    override init() {
        super.init()
        initStocksStorage()
        initCellsStorage()
    }
    
    // MARK: - Work with storages
    private func initStocksStorage() {
        kTickersIDsArray.forEach { [weak self]  (tickerIDString) in
            guard let self = self else { return }
            let stock = Stock(with: tickerIDString)
            self.stocksStorage.append(stock)
        }
    }
    
    private func initCellsStorage() {
        stocksStorage.forEach { [weak self] (stock) in
            guard let self = self else { return }
            
            let viewCell = StockTableViewCell(style: .default, reuseIdentifier: kStockTableViewCellIdentifier)
            self.cellsStorage.append(viewCell)
            viewCell.updateCell(with: stock)
        }
    }
    
    /// Save new values, update cells
    func changeStock(with tickerChanges: TickerChanges) {
        debugPrint(tickerChanges)
        guard let changedStockIndex = indexOfStock(withTickerID: tickerChanges.c) else {
            debugPrint("ERROR: ticker did not exist")
            return
        }
        
        let stock = stocksStorage[changedStockIndex]
        if !tickerChanges.name.isEmpty {
            stock.name = tickerChanges.name
        }
        
        if !tickerChanges.ltr.isEmpty {
            stock.ltr = tickerChanges.ltr
        }
        
        if tickerChanges.pcp != 0 {
            stock.growType = tickerChanges.pcp.compare(stock.pcp)
            stock.pcp = tickerChanges.pcp
        }
        
        if tickerChanges.ltp != 0 {
            stock.ltp = tickerChanges.ltp
        }
        
        if tickerChanges.chg != 0 {
            stock.chg = tickerChanges.chg
        }
        
        let cell = cellsStorage[changedStockIndex]
        cell.updateCell(with: stock)
    }
    
    private func indexOfStock(withTickerID tickerID: String) -> Int? {
        return kTickersIDsArray.firstIndex(where: { $0 == tickerID })
    }
        
    // MARK: - UITableViewDataSource implementation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsStorage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < cellsStorage.count else {
            return UITableViewCell(style: .default, reuseIdentifier: "EmptyCell")
        }
        
        let viewCell = cellsStorage[indexPath.row]
        return viewCell
    }
}
