//
//  Block.swift
//  BlockChain
//
//  Created by Bruno Faganello Neto on 03/01/18.
//  Copyright © 2018 Faganello. All rights reserved.
//

import Cocoa

class Block{
    var index :Int = 0
    var dateCreated :String
    var previousHash :String!
    var hash :String!
    var nonce :Int
    var data :String
    var key :String {
        get {
            return String(self.index) + self.dateCreated + self.previousHash + String(self.nonce)
        }
    }
    
    init(data :String) {
        self.dateCreated = Date().toString()
        self.nonce = 0
        self.data = data
    }
}
