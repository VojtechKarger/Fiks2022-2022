//
//  RunningTheAlgorithm.swift
//  Fiks
//
//  Created by vojta on 19.01.2022.
//

import Foundation


func runTheCode() {
    let path = "input.txt"
    let input = getContents(path)
    //input for testing.... - works for this X)
    //"""
    //2
    //6 6 0
    //0 1
    //1 2
    //1 3
    //3 2
    //2 4
    //2 5
    //2 2 0
    //0 1
    //1 0
    //"""



    let devidedInput = devideInput(input)

    var solution = ""
    var j = 0
    for i in devidedInput {
        print("\(j): ")
        j += 1
        do {
            let data = try process(object: i)
            var str = ""
            data.forEach{ str += " \($0)" }
            solution += "pujde to" + str + "\n"
            print("pujde to",str)
        }catch {
            solution += "ajajaj\n"
            print("ajajaj")
        }
    }
    
    saveTheFile(solution, path)
    
}

