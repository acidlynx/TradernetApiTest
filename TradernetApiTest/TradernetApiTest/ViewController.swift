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
        guard let socket = TradernetApiService.socket else {
            return
        }
        
        socket.connect()
        
        socket.on(clientEvent: .connect) { (data, ack) in
            print("socket connected")
        }
        
        socket.emit("sup_updateSecurities2", with: kTickersIDsArray)
        
        socket.on("q") { (data, ack) in
            print(data)
        }
        

    }
}

