//
//  ContentDetailView.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/20/21.
//

import SwiftUI
import AVKit
import WebKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var lessonId: Int
    @State var moduleId: Int
    @State var lessonName: String = ""
    @State var url: URL?
    
    var body: some View {
        
        let player = AVPlayer(url: ((url ?? URL(string: "https://codewithchris.github.io/learningJSON/"))!))
        
        VStack(alignment: .leading){
            /*Text(model.modules[moduleId].content.lessons[lessonId].title)
                .bold()
                .font(.largeTitle)*/
            VideoPlayer(player: player)
                .cornerRadius(10)
                .shadow(radius: 5)
           

            MyTextUIView(textDesc: model.stringToAttributed(value: model.modules[moduleId].content.lessons[lessonId].explanation))

            
            
            if(model.hasNextLesson(moduleIndex: moduleId, lessonIndex: lessonId)){
                Button(action: {
                    player.pause()
                    url = URL(string: "https://codewithchris.github.io/learningJSON/" + (model.modules[moduleId].content.lessons[lessonId].video))
                    lessonId += 1
                    lessonName = model.getLessonName(moduleId: moduleId, lessonId: lessonId)
                }, label: {
                    ZStack{
                        MyRectangleView(color: .green)
                        Text("NEXT LESSON: " + model.modules[moduleId].content.lessons[lessonId+1].title)
                            .bold()
                            .foregroundColor(.white)
                            
                    }
                })
            }
            else{
                Button(action: {
                    model.selectedIndex = nil
                }, label: {
                    ZStack{
                        MyRectangleView(color: .blue)
                        Text("Back to Home")
                            .bold()
                            .foregroundColor(.white)
                    }
                })
            }
        }
        .onAppear(perform: {
            url = URL(string: "https://codewithchris.github.io/learningJSON/" + (model.modules[moduleId].content.lessons[lessonId].video))
            lessonName = model.getLessonName(moduleId: moduleId, lessonId: lessonId)
        })
        .navigationTitle(lessonName)
        .padding(.horizontal)
        
        
    }
}

struct MyTextUIView: UIViewRepresentable{
    
    var textDesc = NSAttributedString()
    
    func makeUIView(context: UIViewRepresentableContext<MyTextUIView>) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.scrollsToTop = true
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: UIViewRepresentableContext<MyTextUIView>) {
        //Code goes here
        textView.attributedText = textDesc
        
        textView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
    }
    
    /* //CODE TO LOAD A WEBSITE
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let url = URL(string: "https://www.apple.com/")
        uiView.load(URLRequest(url: url!))
    }*/
    
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentDetailView(lessonId: 1, moduleId: 0)
                .environmentObject(ContentModel())
        }
    }
}
