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
    
}
