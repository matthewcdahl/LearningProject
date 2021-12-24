//
//  TestView.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/23/21.
//

import SwiftUI
import CoreMIDI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var currentModuleId: Int
    @State var currentQuestionId: Int
    @State var selectedAnswer: Int = -1
    @State var answerSubmitted: Bool = false
    @State var numberCorrect = 0
    
    var body: some View {
        
        
        if currentQuestionId < model.modules[currentModuleId].test.questions.count{
            let questions = model.modules[currentModuleId].test.questions
            let correctAnswer = questions[currentQuestionId].correctIndex
            VStack(alignment: .leading){
                //Label
                Text("Question \(currentQuestionId+1) out of \(model.getNumberOfQuestions(moduleId: currentModuleId))")
                
                
                //Question
                MyTextUIView(textDesc: model.stringToAttributed(value: model.modules[currentModuleId].test.questions[currentQuestionId].content))
                
                Spacer()
                //Answers
                ScrollView{
                    VStack(spacing: 20){
                        ForEach(0..<questions[currentQuestionId].answers.count,id: \.self){ index in
                            
                            if !answerSubmitted{
                                Button(action: {
                                    selectedAnswer = index
                                    //currentQuestionId += 1
                                }, label: {
                                    ZStack{
                                        MyRectangleView(color: index == selectedAnswer ? .gray: .white, height: 50)
                                        Text(questions[currentQuestionId].answers[index])
                                            .foregroundColor(.black)
                                    }
                                })
                            }
                            else{
                                ZStack{
                                    
                                    MyRectangleView(color: (index == correctAnswer) ? .green: (index == selectedAnswer && selectedAnswer != correctAnswer) ? .red : .white, height: 50)
                                    Text(questions[currentQuestionId].answers[index])
                                        .foregroundColor(.black)
                                }
                            }
                            
                        }
                    }
                    .padding()
                }
                    .frame(height: 370, alignment: .center)
                
                //Button
                
                Button(action:{
                    if(selectedAnswer > -1 && !answerSubmitted){
                        answerSubmitted = true
                    } else if(answerSubmitted){
                        if(selectedAnswer == correctAnswer){
                            numberCorrect += 1
                        }
                        selectedAnswer = -1
                        answerSubmitted = false
                        currentQuestionId += 1
                        
                    }
                } , label:{
                    ZStack{
                        MyRectangleView(color: selectedAnswer > -1 ? .green : .gray)
                            .padding()
                        if !answerSubmitted {
                            Text("Submit")
                                .foregroundColor(.white)
                        }
                        else if(currentModuleId == (questions.count-1)){
                            Text("Finish Quiz")
                                .foregroundColor(.white)
                        }
                        else{
                            Text("Next Question")
                                .foregroundColor(.white)
                        }
                    }
                })
                    
                
            }
            .navigationBarTitle("\(model.modules[currentModuleId].category) Test")
            .padding()
        }
        else{
            QuizFinishedView(numCorrect: numberCorrect, totalNumber: model.modules[currentModuleId].test.questions.count)
                .navigationBarTitle("\(model.modules[currentModuleId].category) Test Results")
                .navigationBarBackButtonHidden(true)
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TestView(currentModuleId: 0, currentQuestionId: 0)
                .environmentObject(ContentModel())
        }
    }
}
