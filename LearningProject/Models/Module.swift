//
//  Module.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/18/21.
//

import Foundation

class Module: Identifiable, Decodable{
    
    var id: Int
    var category: String
    var content: Content
    var test: Test
    
}
