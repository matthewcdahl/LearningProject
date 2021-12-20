//
//  ContentModel.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/17/21.
//

import Foundation

class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init(){
        modules = DataService.getLocalData()
        styleData = DataService.getStyleData()
    }
    
    func getTotalLessonTime(moduleIndex: Int) -> Int{
        var totalTime = 0
        for l in modules[moduleIndex].content.lessons{
            totalTime += Int(l.duration.components(separatedBy: " ").first ?? "0") ?? 0
        }
        return totalTime
    }
    
    func getTotalQuizTime(moduleIndex: Int) -> Int{
        var totalTime = 0
        totalTime += Int(modules[moduleIndex].test.time.components(separatedBy: " ").first ?? "0") ?? 0
        return totalTime
    }
    
}
