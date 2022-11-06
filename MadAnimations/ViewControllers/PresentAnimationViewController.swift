//
//  ViewController.swift
//  MadAnimations
//
//  Created by Aleksandr Mayyura on 31.10.2022.
//

import UIKit
import SpringAnimation

class PresentAnimationViewController: UIViewController {
    
    @IBOutlet var animationInfoLabel: UILabel! {
        didSet {
            animationInfoLabel.text = animation.description
        }
    }
    
    @IBOutlet var animatedView: SpringView!
    
    private var animation = Animation.getAnimations()

    @IBAction func animateViewOnTapped(_ sender: UIButton) {
        animationInfoLabel.text = animation.description
        
        animatedView.animation = animation.preset
        animatedView.curve = animation.curve
        animatedView.duration = animation.duration
        animatedView.damping = animation.damping
        animatedView.velocity = animation.velocity
        animatedView.animate()
        
        animation = Animation.getAnimations()
        sender.setTitle("Run \(animation.preset)", for: .normal)
    }
}

