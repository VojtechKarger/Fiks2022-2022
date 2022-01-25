//
//  main.swift
//  Fiks
//
//  Created by vojta on 18.01.2022.
//

import Foundation


func Krmeni() {
    let path = "input.txt"
    let input = //getContents(path)
"""
6 3
1 2
2 3
2 4
3 5
3 6
1 2
2 3 4
3 1 5 6
"""
        .components(separatedBy: .newlines)
    let data = input[0].components(separatedBy: .whitespaces).map(Int.toInt)
    let (N,Q) = (data[0],data[1])
    
    var graph = [Int: [Int]]()
    
    for i in 1..<N {
        let value = input[i].components(separatedBy: .whitespaces).map(Int.toInt)
        let arr = graph[value[0]] ?? []
        graph[value[0]] = arr + [value[1]]
    }
    for i in N...(N + Q) {
        let row = input[i].components(separatedBy: .whitespaces).map(Int.toInt)
        

    }
}



Krmeni()


