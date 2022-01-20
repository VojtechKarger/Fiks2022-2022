//
//  GetInput.swift
//  Fiks
//
//  Created by vojta on 18.01.2022.
//

import Foundation


func getContents(_ path: String) -> String {
    do{
        return try String(contentsOfFile: "/Users/vojta/Downloads/" + path)
    }catch{
        print(error)
        exit(EXIT_FAILURE)
    }
}

func saveTheFile(_ result: String,_ path: String) {
    do{
        let name = "/Users/vojta/Desktop/solution-" + path
        
        guard result != "" else { throw error.noResult }
        guard let contents = result.data(using: .utf8) else { throw error.noData }
        
        if FileManager.default.createFile(atPath: name, contents: contents, attributes: nil) {
            print(name)
            exit(EXIT_SUCCESS)
        }else{
            throw error.canotCreateFile
        }
    }catch{
        print(error)
        exit(EXIT_FAILURE)
    }
    
    
}

