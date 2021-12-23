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
    @Published var selectedIndex: Int?
    
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
    
    func hasNextLesson(moduleIndex: Int, lessonIndex: Int) -> Bool{
        let rtn = lessonIndex+1 < modules[moduleIndex].content.lessons.count
        return rtn
    }
    
    func stringToAttributed(value: String) -> NSAttributedString{
        var attString = NSAttributedString()
        var data = Data()
        if(styleData != nil){
            data.append(self.styleData!)
        }
        data.append(Data(value.utf8))
        

        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil){
            
            attString = attributedString
            
        }
        
        return attString
    }
    
}
