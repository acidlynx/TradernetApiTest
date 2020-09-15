//
//  TradernetService.swift
//  TradernetApiTest
//
//  Created by User on 06.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import Foundation
import SocketIO

let apiURLString = "https://ws3.tradernet.ru/"

open class TradernetApiService {
    public static let `default` = TradernetApiService()
    private let manager: SocketManager
    var socket: SocketIOClient

    private init() {
        manager = SocketManager(socketURL: URL(string: apiURLString)!, config: [.log(true), /*.forceWebsockets(true)*/])
        socket = manager.defaultSocket
    }
}
