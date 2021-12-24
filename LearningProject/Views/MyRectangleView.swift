//
//  MyRectangleView.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/23/21.
//

import SwiftUI

struct MyRectangleView: View {
    
    var color: Color
    var height: CGFloat?
    
    
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(10)
            .frame(height: height != nil ? height : 70, alignment: .center)
            .shadow(radius: 5)

                
        
    }
}
