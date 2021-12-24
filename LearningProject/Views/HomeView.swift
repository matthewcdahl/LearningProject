//
//  ContentView.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/17/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    Text("What would you like to do today?")
                        .font(.title3)
                        .padding(.leading, 20)
                    LazyVStack(alignment: .leading, spacing: 10){
                        ForEach(model.modules){ m in
                            
                            NavigationLink(destination: ContentView(moduleId: m.id), tag: m.id, selection: $model.selectedIndex, label: {
                                CardView(image: m.content.image,
                                         title: m.category + " Lessons",
                                         description: m.content.description,
                                         firstIcon: "list.bullet",
                                         firstDescription: String(m.content.lessons.count) + " Lessons",
                                         secondIcon: "clock",
                                         secondDescription: String(model.getTotalLessonTime(moduleIndex: m.id)) + " Minutes")
                                    .foregroundColor(.black)
                            })
                            NavigationLink(destination: TestView(currentModuleId: m.id, currentQuestionId: 0), tag: m.id, selection: $model.selectedTestIndex, label: {
                                CardView(image: m.test.image,
                                         title: m.category + " Quiz",
                                         description: m.test.description,
                                         firstIcon: "list.bullet",
                                         firstDescription: String(m.test.questions.count) + " Questions",
                                         secondIcon: "clock",
                                         secondDescription: String(model.getTotalQuizTime(moduleIndex: m.id)) + " Minutes")
                                    .foregroundColor(.black)
                            })
                        }
                    }
                    .navigationBarTitle("Get Started")
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct CardView: View{
    
    var image: String
    var title: String
    var description: String
    var firstIcon: String
    var firstDescription: String
    var secondIcon: String
    var secondDescription: String
    
    var body: some View{
        
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: 4, y: 4)
            HStack(spacing: 20){
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(0.7, contentMode: .fit)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 15){
                    Text(title)
                        .font(.headline)
                    Text(description)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                    HStack{
                        HStack{
                            Image(systemName: firstIcon)
                            Text(firstDescription)
                        }
                        Spacer()
                        HStack{
                            Image(systemName: secondIcon)
                            Text(secondDescription)
                        }
                    }.font(Font.system(size: 10))
                }
            }
            .padding(.all)
            .padding(.trailing, 5)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
