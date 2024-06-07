//
//  ContentView.swift
//  MyFirstProject
//
//  Created by 水原　樹 on 2024/06/07.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State var enlarge = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    
    var body: some View {
        VStack {
            RealityView { content in
                if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    content.add(scene)
                }
            } update: { content in
                if let scene = content.entities.first {
                    let uniformScale: Float = enlarge ? 2.0 : 1.0
                    scene.transform.scale = [uniformScale, uniformScale, uniformScale]
                }
            }
            .gesture(TapGesture().targetedToAnyEntity().onEnded { value in
                print("Tapped entity \(value.entity)!")
            })

            
            VStack {
                Toggle("Change Size", isOn: $enlarge)
                    .toggleStyle(.button)
            }
            
            Button("Open") {
                Task {
                    print("Attempting to open immersive space...")
                    await openImmersiveSpace(id: "ImmersiveSpace")
                    print("Immersive space should be open now.")
                }
            }
        }
    }
}

#Preview() {
    ContentView()
}
