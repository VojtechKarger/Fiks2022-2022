//
//  Slon.swift
//  Fiks
//
//  Created by vojta on 25.01.2022.
//

import Foundation


func slon() {
    ///name of the file saved on desktop....
    let path = "input-9.txt"

    let input = getContents(path)
    //"""
    //2
    //10 10 3 2 5
    //2 2 0 0 7
    //"""
        .components(separatedBy: "\n")

    ///number of tasks
    let n = input[0].toInt()
    ///current index for looping throught the input
    var i = 1

    var result = ""

    for _ in 0..<n {
        let instructions = input[i]
        let taskResult = solve(instructions)
        result += "\(taskResult)\n"
        print(taskResult)
        i += 1
    }

    print(result)

    func solve(_ instructions: String) -> Int {
        var solutions = Set<String>()
        let arrOfinstructions = instructions
            .components(separatedBy: " ")
            .map(Int.toInt)
        
        let height = arrOfinstructions[0]
        let width = arrOfinstructions[1]
        let X = arrOfinstructions[2]
        let Y = arrOfinstructions[3]
        let Time = arrOfinstructions[4]
        
        func recursiveSolve(_ x: Int,_ y: Int,_ time: Int) {
            if time == 0 {
                solutions.insert("\(x) \(y)")
                return
            }
            if x > 0 {
                recursiveSolve(x - 1, y, time - 1)
            }
            if x < width - 1 {
                recursiveSolve(x + 1, y, time - 1)
            }
            if y > 0 {
                recursiveSolve(x, y - 1, time - 1)
            }
            if y < height - 1 {
                recursiveSolve(x, y + 1, time - 1)
            }
        }

        recursiveSolve(X, Y, Time)
        return solutions.count
    }




}
