//
//  ContentView.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/19/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    var moduleId: Int
    
    var body: some View {
        
        ScrollView{
            VStack{
                ForEach(model.modules[moduleId].content.lessons){ lesson in
                    NavigationLink(destination: {
                        ContentDetailView(lessonId: lesson.id, moduleId: moduleId)
                    }, label: {
                        LessonCardView(id: lesson.id + 1, title: lesson.title, duration: lesson.duration)
                    })
                        .foregroundColor(.black)
                    
                }
            }
        }
        .navigationBarTitle("Learn " + model.modules[moduleId].category)
        
    }
}

struct LessonCardView: View{
    
    var id: Int
    var title: String
    var duration: String
    
    var body: some View{
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.4), radius: 5, x: 1, y: 1)
            HStack(spacing: 20){
                Text(String(id))
                    .bold()
                    .font(.title2)
                    .padding(.horizontal)
                VStack(alignment: .leading, spacing: 3){
                    Text(title)
                        .bold()
                        .font(.title3)
                    Text(duration)
                        .font(.title3)
                }
            }
            .padding()
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 7)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView(moduleId: 0)
                .environmentObject(ContentModel())
        }
    }
}
