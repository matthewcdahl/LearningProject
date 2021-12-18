//
//  Test.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/18/21.
//

import Foundation

class Test: Identifiable, Decodable{
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var questions: [Question]
    
}
