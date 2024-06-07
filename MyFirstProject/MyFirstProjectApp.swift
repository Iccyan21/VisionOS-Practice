//
//  MyFirstProjectApp.swift
//  MyFirstProject
//
//  Created by 水原　樹 on 2024/06/07.
//

import SwiftUI

@main
struct MyFirstProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
