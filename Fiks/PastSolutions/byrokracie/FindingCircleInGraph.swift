//
//  FindingCircleInGraph.swift
//  Fiks
//
//  Created by vojta on 18.01.2022.
//

import Foundation


func findACircle(object: Object) -> Bool {
    let relations = object.relations
    
    let n = object.n
    
    var visited = [Int: Bool]()
    
    func isCycle(_ i: Int) -> Bool {
        if visited[i] != true {
            visited[i] = true
        }else{
            return true
        }
        
        if let arr = relations[i] {
            for j in arr {
                if isCycle(j) {
                    return true
                }else{
                    visited[j] = nil
                }
            }
        }
        return false
    }
    
    return isCycle(n)
}

