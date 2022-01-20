//
//  Helpers.swift
//  Fiks
//
//  Created by vojta on 19.01.2022.
//

import Foundation

class Helpers {
    
    class
    func create2Darray(_ num: Double) -> Array<Array<Int>>{
        let x = sqrt(num)
        if x != x.rounded(.down) {
            let X = Int(x.rounded(.down)) + 1
            var arr = Array(repeating: Array(repeating: -1, count: Int(X)), count: Int(X))
            var k = 1
            for i in 0..<Int(X) {
                for j in 0..<Int(X) {
                    if k <= Int(num) {
                        arr[i][j] = k
                    }
                    k += 1
                }
            }
            return arr
            
        }else{
            var arr = Array(repeating: Array(repeating: 0, count: Int(x)), count: Int(x))
            var k = 1
            for i in 0..<Int(x) {
                for j in 0..<Int(x) {
                    arr[i][j] = k
                    k += 1
                }
            }
            return arr
        }
    }
    
}


