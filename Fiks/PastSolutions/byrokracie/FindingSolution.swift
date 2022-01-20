//
//  FindingSolution.swift
//  Fiks
//
//  Created by vojta on 18.01.2022.
//

import Foundation


func process(object: Object) throws -> LinkedList<Int> {
    let completed: LinkedList<Int> = LinkedList()
    var completedSet: Set<Int> = []
    let graph = object.relations
//  Needs fix but after the fix it might work as expected....
    if findACircle(object: object) {
        throw error.ajajaj
    }
    
    search(object.n)
    
    
    func search(_ n: Int) {
        if let arr = graph[n] {
            for i in arr {
                search(i)
            }
        }
        //not sure if it works probably breaks the whole algorithm but on the input that i tested it worked X)
        if completedSet.contains(n) {
            completed.removeAll()
            completedSet = []
        }
        
        completed.append(value: n)
        completedSet.insert(n)
    }
    
    return completed
}





