//
//  ViewController.swift
//  TradernetApiTest
//
//  Created by User on 06.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import UIKit
import SnapKit

let kStockTableViewCellIdentifier = "kStockTableViewCellIdentifier"

class ViewController: UIViewController {
    // MARK: - support
    let tableDataSource = StocksCellsDataSource()
    
    
    // MARK: - views
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = self.tableDataSource
        tableView.rowHeight = 60.0
        tableView.backgroundColor = .red
        
        tableView.register(StockTableViewCell.self, forCellReuseIdentifier: kStockTableViewCellIdentifier)
        return tableView
    }()
    
}

// MARK: - UIViewController lifecycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        makeLayout()
        
        connectToAPI()
    }
    
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    func makeLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ViewController {
    func connectToAPI() {
        TradernetApiService.default.socket.on(clientEvent: .connect) { (data, ack) in
            TradernetApiService.default.socket.emit("sup_updateSecurities2", with: [kTickersIDsArray])
        }
        
        TradernetApiService.default.socket.on(clientEvent: .error) { (data, ack) in
            debugPrint("ERROR with data:\(data)")
        }
        
        TradernetApiService.default.socket.on("q") { [weak self] (data, ack) in
            guard let self = self else { return }
            self.showNewData(data: data)
        }
         
        TradernetApiService.default.socket.connect()
    }
    
    /// Parse data from the response and make object to show
    func showNewData(data: [Any]) {
        data.forEach { (dataAny) in
            let dataArray = dataAny as! [String: Any]
            let tickersArray = dataArray["q"] as! [Dictionary<String, Any>]
            
            tickersArray.forEach { (tickerDictionary) in
                let newTickerChanges = TickerChanges(tickerDataDictionary: tickerDictionary)
                debugPrint(newTickerChanges)
            }
        }
    }
}
