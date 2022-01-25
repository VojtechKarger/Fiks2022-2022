//
//  ToInt.swift
//  Fiks
//
//  Created by vojta on 21.01.2022.
//

import Foundation


extension String{
    func toInt() -> Int {
        return Int(self)!
    }
}
extension Int {
    static
    func toInt(_ string: String) -> Int {
        return Int(string)!
    }
}
