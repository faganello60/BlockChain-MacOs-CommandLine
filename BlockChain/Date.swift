//
//  Date.swift
//  BlockChain
//
//  Created by Bruno Faganello Neto on 03/01/18.
//  Copyright © 2018 Faganello. All rights reserved.
//

import Cocoa

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: self)
    }
}
