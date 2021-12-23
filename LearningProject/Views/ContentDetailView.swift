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

    @State var url: URL?
    
    var body: some View {
        VStack(alignment: .leading){
            Text(model.modules[moduleId].content.lessons[lessonId].title)
                .bold()
                .font(.largeTitle)
            VideoPlayer(player: AVPlayer(url: ((url ?? URL(string: "https://codewithchris.github.io/learningJSON/"))!)))
                .cornerRadius(10)
                .shadow(radius: 5)
           

            MyTextUIView(textDesc: model.stringToAttributed(value: model.modules[moduleId].content.lessons[lessonId].explanation))

            
            
            if(model.hasNextLesson(moduleIndex: moduleId, lessonIndex: lessonId)){
                Button(action: {
                    lessonId += 1
                    url = URL(string: "https://codewithchris.github.io/learningJSON/" + (model.modules[moduleId].content.lessons[lessonId].video ?? ""))
                }, label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .frame(height: 70, alignment: .center)
                            .shadow(radius: 5)
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
                        Rectangle()
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                            .frame(height: 70, alignment: .center)
                            .shadow(radius: 5)
                        Text("Back to Home")
                            .bold()
                            .foregroundColor(.white)
                            
                    }
                })
            }
        }
        .onAppear(perform: {
            url = URL(string: "https://codewithchris.github.io/learningJSON/" + (model.modules[moduleId].content.lessons[lessonId].video ?? ""))
        })
        .navigationBarHidden(true)
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
