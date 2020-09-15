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
            debugPrint("DDDEBUG: socket connected")
            TradernetApiService.default.socket.emit("sup_updateSecurities2", with: [kTickersIDsArray])
        }
        
        TradernetApiService.default.socket.on(clientEvent: .error) { (data, ack) in
            debugPrint("error with data:\(data)")
        }
        
        TradernetApiService.default.socket.on("q") { [weak self] (data, ack) in
            guard let self = self else { return }
            self.showNewData(data: data)
        }
         
        TradernetApiService.default.socket.connect()
    }
    
    func showNewData(data: [Any]) {
        debugPrint("DDDEBUG: new data: \(data)")
    }
}

