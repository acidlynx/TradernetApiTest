//
//  ViewController.swift
//  TradernetApiTest
//
//  Created by User on 06.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        connectToAPI()
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
    
    /// parse data from the response and make object to show
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
