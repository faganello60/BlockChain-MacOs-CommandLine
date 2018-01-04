//
//  Buffer.swift
//  BlockChain
//
//  Created by Bruno Faganello Neto on 03/01/18.
//  Copyright © 2018 Faganello. All rights reserved.
//
import Cocoa
class Buffer{
    class func write(text: String, to fileNamed: String, folder: String = "SavedFiles") {
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { return }
        guard let writePath = NSURL(fileURLWithPath: path).appendingPathComponent(folder) else { return }
        try? FileManager.default.createDirectory(atPath: writePath.path, withIntermediateDirectories: true)
        let file = writePath.appendingPathComponent(fileNamed + ".txt")
        try? text.write(to: file, atomically: false, encoding: String.Encoding.utf8)
    }
    
    class func readData() -> String{
        let readPath = URL(string: "file:///Users/Faganello/Documents/Hash/information.txt")
        let file = try? String(contentsOf: readPath!, encoding: String.Encoding.utf8)
        guard let text = file else{ return ""}
        return text
    }
}
