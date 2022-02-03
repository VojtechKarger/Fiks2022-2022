//
//  main.swift
//  Fiks
//
//  Created by vojta on 18.01.2022.
//

import Foundation


func Krmeni() {
    let path = "input-10.txt"
    let input = getContents(path)
//"""
//6 3
//1 2
//2 3
//2 4
//3 5
//3 6
//1 2
//2 3 4
//3 1 5 6
//"""
        .components(separatedBy: .newlines)
    let data = input[0].components(separatedBy: .whitespaces).map(Int.toInt)
    let (N,Q) = (data[0],data[1])
    
    var graph = [Int: [Int]]()
    let values = LinkedList<Int>()
//    for i in 0..<N {
//        values.append(i + 1)
//    }
    for i in 1..<N {
        let value = input[i].components(separatedBy: .whitespaces).map(Int.toInt)
        if let arr = graph[value[0]] {
            graph[value[0]] = arr + [value[1]]
        }else {
            graph[value[0]] = [value[1]]
            values.append(value[0])
        }
        if let arr = graph[value[1]] {
            graph[value[1]] = arr + [value[0]]
        }else {
            graph[value[1]] = [value[0]]
            values.append(value[1])
        }
        print(i)
    }
    //print(BFS_edited(1, graph,[1,5,6]))
    //print(BFS(3, graph: graph, row: [1,5,6]))
    var output = ""
    for i in N..<(N + Q) {
        var k = input[i].components(separatedBy: .whitespaces).map(Int.toInt)
        k.removeFirst()
        let row = Set(k)
        let basicVal = BFS_edited(1, graph, row)
        var minVal = basicVal
        print(row)
        values.forEach { value in
            let val = BFS_edited(value, graph, row)
            if val <= minVal {
                minVal = val
                print(val)
            }
        }
        print(minVal, basicVal)
        output += String(abs(basicVal - minVal)) + "\n"
    }
    print(output)
}

Krmeni()


func BFS_edited(_ n: Int,_ graph: [Int: [Int]],_ row: Set<Int>) -> Int {
    var row = row
    var queue = Array<(Int,Int)>()
    var i = 0
    var result = 0
    var visited = Set<Int>()
    queue.append((n,i))
    while !queue.isEmpty {
        let curr = queue.removeFirst()
        if i != curr.1 {
            i += 1
        }
        if row.contains(curr.0) { result += i; row.remove(curr.0) }
        guard let arr = graph[curr.0] else { continue }
        for j in arr {
            if !visited.contains(j) {
                visited.insert(j)
                queue.append((j,i + 1))
            }
        }
        if row.isEmpty { break }
    }
        return result
}










