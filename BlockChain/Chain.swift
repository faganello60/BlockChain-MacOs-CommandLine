//
//  Chain.swift
//  BlockChain
//
//  Created by Bruno Faganello Neto on 03/01/18.
//  Copyright © 2018 Faganello. All rights reserved.
//

import Cocoa

class Chain{
    private (set) var blocks: [Block] = [Block]()
    
    init(_ genesisBlock :Block) {
        addBlock(genesisBlock)
    }
    
    func addBlock(_ block :Block) {
        
        if self.blocks.isEmpty {
            // add the genesis block
            // no previous has was found for the first block
            block.previousHash = "0"
            block.hash = generateHash(for: block)
        } else {
            let previousBlock = getPreviousBlock()
            block.previousHash = previousBlock.hash
            block.index = self.blocks.count
            block.hash = generateHash(for: block)
        }
        
        self.blocks.append(block)
        displayBlock(block)
    }
    
    private func getPreviousBlock() -> Block {
        return self.blocks[self.blocks.count - 1]
    }
    
    
    private func displayBlock(_ block :Block) {
        let value = """
        ------ Block \(block.index) ---------
        Date Created : \(block.dateCreated)
        Data : \(block.data)
        Nonce : \(block.nonce)
        Previous Hash : \(block.previousHash!)
        Hash : \(block.hash!)
        ------ End Block -----------------------
        """
        print(value)
        var text = Buffer.readData()
        text = "\(text)\n\n\(value)"
        Buffer.write(text: text, to: "information", folder: "Hash")
    }
    
    private func generateHash(for block: Block) -> String {
        var hash = block.key.sha1Hash()
    
        // setting the proof of work.
        // In "00" is good to start since "0000" will take forever and Playground will eventually crash :)
        while(!hash.hasPrefix("00")) {
            block.nonce += 1
            hash = block.key.sha1Hash()
            print(hash)
        }
        return hash
    }
}
