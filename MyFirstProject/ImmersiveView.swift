//
//  ImmersiveView.swift
//  MyFirstProject
//
//  Created by 水原　樹 on 2024/06/07.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct ImmersiveView: View {
    var body: some View {
        RealityView{ content in
            if let scene = try? await Entity(named: "Scene1",in: realityKitContentBundle){
                content.add(scene)
            }
        }.gesture(TapGesture().targetedToAnyEntity().onEnded { value in
            var transform = value.entity.transform
            transform.translation += SIMD3(0.1, 0, -0.1)
            value.entity.move(
                to: transform,
                relativeTo: nil,
                duration: 3,
                timingFunction: .easeInOut
            )
        })
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
