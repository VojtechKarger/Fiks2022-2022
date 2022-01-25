//
//  Pozemky.swift
//  Fiks
//
//  Created by vojta on 20.01.2022.
//

import Foundation

func pozemky() {
    
    let input = (try! String(contentsOfFile: "/Users/vojta/Downloads/" + "input-8.txt"))
        .components(separatedBy: "\n")
    ///number of task to solve
    let n = Int(input[0])!

    var result = ""
    ///index for current row
    var i = 1
    //looping throught every task
    for _ in 0..<n {
      ///number of rows in this task
        let m = Int(input[i])!
        i += 1
        var rowResult = 0
        for _ in 0..<m {
            ///current row
            let row = input[i].components(separatedBy: " ")
            rowResult += Int(row[1])! * Int(row[2])!
            i += 1
        }
        result += String(rowResult) + "\n"
    }

    //saves the result to the file
    saveTheFile(result, "input-8.txt")

    
}
