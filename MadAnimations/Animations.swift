//
//  Animstions.swift
//  MadAnimations
//
//  Created by Aleksandr Mayyura on 01.11.2022.
//

import Foundation

struct Animations {
    let preset: String
    let curve: String
    let duration: CGFloat
    let damping: CGFloat
    let velocity: CGFloat

    static func getAnimations() -> Animations {
        
        let animationSpring = AnimationSpring()
        
        let animations = Animations(
            preset: animationSpring.animations.randomElement() ?? "",
            curve: animationSpring.curves.randomElement() ?? "",
            duration: CGFloat.random(in: 0.9...1.4),
            damping: CGFloat.random(in: 0.8...1),
            velocity: CGFloat.random(in: 0.2...0.5)
        )
        return animations
    }
}
