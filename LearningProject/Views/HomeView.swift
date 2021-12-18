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
        VStack{
            ForEach(model.modules){m in
                ForEach(m.content.lessons){l in
                    Text(l.title)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
