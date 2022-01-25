//
//  FindingSolution.swift
//  Fiks
//
//  Created by vojta on 18.01.2022.
//

import Foundation

func process(object: Object) throws -> LinkedList<Int> {
    //var completed: LinkedList<Int> = LinkedList()
    //var completedSet: Set<Int> = []
    let graph = object.relations
//  Needs fix but after the fix it might work as expected....
    if findACircle(object: object) {
        throw error.ajajaj
    }
    
    let completed = search(n: object.n, graph: graph)
    
//    func search(_ n: Int) {
//        if let arr = graph[n] {
//            for i in arr {
//                search(i)
//            }
//        }
//        //not sure if it works probably breaks the whole algorithm but on the input that i tested it worked X)
//        if completedSet.contains(n) {
//            completed.removeAll()
//            completedSet = []
//        }
//
//        completed.append(n)
//        completedSet.insert(n)
//    }
    func search(n: Int, graph: [Int: [Int]]) -> LinkedList<Int>{
        let result = LinkedList<Int>()
        let queue = LinkedList<Int>()
        queue.append(n)
        while !queue.isEmpty {
            guard let curr = queue.popFirst() else { continue }
            //preform the action that you want
            result.append(curr)
            guard let arr = graph[curr] else { continue }
            for i in arr {
                queue.append(i)
            }
        }
        
        return result
    }
    
    return completed
}








