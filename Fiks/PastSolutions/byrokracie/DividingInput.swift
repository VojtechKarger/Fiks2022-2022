//
//  DividingInput.swift
//  Fiks
//
//  Created by vojta on 18.01.2022.
//

import Foundation

struct Object {
    ///označuje počet povolení
    let P: Int
    
    ///označuje číslo povolení ke stavbě
    let n: Int
    
    ///značí počet řádků na kterých je daná úloha
    let Z: Int
    
    ///značí závislosti jednotlivých dokumentů na sobě
    ///
    ///je to dictionary:
    /// - Key:   značí číslo dokumentu
    /// - Value:  dokumenty které je nutno vyřídit před tím než je vyřízen tento dokument
    var relations: [Int:[Int]]
}



func devideInput(_ input: String) -> Array<Object>{
    let data = input.components(separatedBy: "\n")
    
    let numberOfProblems = Int(data[0])!
    var arr: Array<Object> = []
    
    var i = 1
    for k in 0..<numberOfProblems {

        let dataRow = data[i].components(separatedBy: " ").map(Int.init).map{ $0! }
        var object = Object(P: dataRow[0], n: dataRow[2], Z: dataRow[1], relations: [:])
        i += 1
        for _ in 0..<object.Z {
            let row = data[i].components(separatedBy: " ").map(Int.init).map{ $0! }
            if let val = object.relations[row[0]] {
                object.relations[row[0]] = val + [row[1]]
            }else{
                object.relations[row[0]] = [row[1]]
            }
            i += 1
        }
        arr.append(object)
        if k == 81 {
            print(object)
        }
    }
    return arr
}







