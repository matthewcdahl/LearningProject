//
//  QuizFinishedView.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/23/21.
//

import SwiftUI

struct QuizFinishedView: View {
    
    var numCorrect: Int
    var totalNumber: Int
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack{
            Spacer()
            Text("You got \(numCorrect) out of \(totalNumber) questions correct")
            Spacer()
            Button(action: {
                model.selectedTestIndex = nil
            }, label: {
                ZStack{
                    MyRectangleView(color: .green)
                    Text("Return to Home")
                        .foregroundColor(.white)
                }
            })
        }
        .padding()
    }
}

struct QuizFinishedView_Previews: PreviewProvider {
    static var previews: some View {
        QuizFinishedView(numCorrect: 4, totalNumber: 10)
            .environmentObject(ContentModel())
    }
}
