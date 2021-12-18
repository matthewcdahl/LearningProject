//
//  Question.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/18/21.
//

import Foundation


class Question: Identifiable, Decodable{
    
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
}
