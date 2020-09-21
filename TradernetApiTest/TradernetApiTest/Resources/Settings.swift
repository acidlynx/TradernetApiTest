//
//  Settings.swift
//  TradernetApiTest
//
//  Created by User on 06.09.2020.
//  Copyright © 2020 Binira. All rights reserved.
//

import Foundation

let kApiURLString = "https://ws3.tradernet.ru/"

/// Returns list of tickres as comma-separated string
let kTickersIDsString = "RSTI,GAZP,MRKZ,RUAL,HYDR,MRKS,SBER,FEES,TGKA,VTBR,ANH.US,VICL.US,BURG. US,NBL.US,YETI.US,WSFS.US,NIO.US,DXC.US,MIC.US,HSBC.US,EXPN.EU,GSK.EU,SH P.EU,MAN.EU,DB1.EU,MUV2.EU,TATE.EU,KGF.EU,MGGT.EU,SGGD.EU"

/// Returns list of tickers as `[String]`
let kTickersIDsArray: [String] = {
    let splittedString = kTickersIDsString.components(separatedBy: ",")
    return splittedString
}()
