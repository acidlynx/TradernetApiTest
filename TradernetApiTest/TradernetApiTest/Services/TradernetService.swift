//
//  TradernetService.swift
//  TradernetApiTest
//
//  Created by User on 06.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import Foundation
import SocketIO

let apiURLString = "https://ws3.tradernet.ru"

class TradernetApiService {
    static var socket: SocketIOClient? = {
        guard let apiURL = URL(string: apiURLString) else {
            return nil
        }
        
        let manager = SocketManager(socketURL: apiURL, config: [.log(true)])
        let socket = manager.defaultSocket
        
        return socket
    }()
}
