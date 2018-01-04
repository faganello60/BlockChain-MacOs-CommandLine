//
//  main.swift
//  BlockChain
//
//  Created by Bruno Faganello Neto on 03/01/18.
//  Copyright © 2018 Faganello. All rights reserved.
//

import Foundation

print("Digite sua informação:")
let keyboard = readLine()
let firstBlock = Block(data: keyboard!)
let chain = Chain(firstBlock)

for _ in 1...5{
    print("Digite sua informação:")
    let text = readLine()
    let block = Block(data: text!)
    chain.addBlock(block)
}
