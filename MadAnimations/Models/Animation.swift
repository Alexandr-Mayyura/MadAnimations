//
//  Animstions.swift
//  MadAnimations
//
//  Created by Aleksandr Mayyura on 01.11.2022.
//

import Foundation

struct Animation {
    let preset: String
    let curve: String
    let duration: Double
    let damping: Double
    let velocity: Double
    
    var description: String {
        """
        preset: \(preset)
        curve: \(curve)
        duration: \(String(format: "%.02F", duration))
        damping: \(String(format: "%.02F", damping))
        velocity: \(String(format: "%.02F", velocity))
        """
    }
    
    static func getAnimations() -> Animation {
        Animation(
            preset: DataStore.shared.animations.randomElement()?.rawValue ?? "slideLeft",
            curve: DataStore.shared.curves.randomElement()?.rawValue ?? "easeIn",
            duration: Double.random(in: 1...1.4),
            damping: Double.random(in: 0.9...1.2),
            velocity: Double.random(in: 0.8...1.5)
        )
    }
}
