//
//  LearningProjectApp.swift
//  LearningProject
//
//  Created by Matt Dahl on 12/17/21.
//

import SwiftUI

@main
struct LearningProjectApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
