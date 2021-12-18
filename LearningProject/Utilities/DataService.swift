//
//  DataService.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/18/21.
//

import Foundation

class DataService{
    
    
    static func getLocalData() ->[Module]{
        
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        
        guard url != nil else{
            return [Module]()
        }
                
        do{
            let data = try Data(contentsOf: url!)
            let decoder = JSONDecoder()
            
            let modules = try decoder.decode([Module].self, from: data)
            
            return modules
            
        }
        catch{
            print(error)
        }
        
        return [Module]()
        
    }
    
    static func getStyleData() -> Data{
        
        let url = Bundle.main.url(forResource: "style", withExtension: "html")
        
        guard url != nil else{
            return Data()
        }
        
        do{
            let data = try Data(contentsOf: url!)
            return data
        }
        catch{
            print(error)
        }
        
        return Data()
        
    }
}

