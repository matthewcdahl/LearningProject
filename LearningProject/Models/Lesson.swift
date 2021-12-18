//
//  Lesson.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/18/21.
//

import Foundation

class Lesson: Identifiable, Decodable{
    
    var id: Int
    var title: String
    var video: String
    var duration: String
    var explanation: String
    
}
