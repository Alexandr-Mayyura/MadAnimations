//
//  ViewController.swift
//  MadAnimations
//
//  Created by Aleksandr Mayyura on 31.10.2022.
//

import UIKit
import SpringAnimation

class PresentAnimationViewController: UIViewController {
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var dampingLabel: UILabel!
    @IBOutlet var velocityLabel: UILabel!
    
    @IBOutlet var animatedView: SpringView!
    
    private let startAnimation = Animation.getAnimations()
    
    private var futureAnimation = ""
    private var isButtonPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedView.layer.cornerRadius = 10
        getValueForLabelsFrom(animation: startAnimation)
    }
    
    @IBAction func animateViewOnTapped(_ sender: UIButton) {
        animatedView.animation = futureAnimation
        
        let randomAnimation = Animation.getAnimations()
        if isButtonPressed {
            
            getAnimation(from: randomAnimation)
            getValueForLabelsFrom(springView: animatedView)
            futureAnimation = randomAnimation.preset
        } else {
            animatedView.animation = startAnimation.preset
            getAnimation(from: startAnimation)
            
            futureAnimation = randomAnimation.preset
            isButtonPressed = true
        }
        sender.setTitle("Run \(futureAnimation)", for: .normal)
    }
    
    private func getAnimation(from animation: Animation) {
        animatedView.curve = animation.curve
        animatedView.duration = animation.duration
        animatedView.damping = animation.damping
        animatedView.velocity = animation.velocity
        animatedView.animate()
    }
    
    private func getValueForLabelsFrom(animation: Animation? = nil, springView: SpringView? = nil) {
        if animation != nil {
            guard let animation = animation else { return }
            presetLabel.text = animation.preset
            curveLabel.text = animation.curve
            durationLabel.text = string(from: animation.duration)
            dampingLabel.text = string(from: animation.damping)
            velocityLabel.text = string(from: animation.velocity)
        } else {
            guard let springView = springView else { return }
            presetLabel.text = springView.animation
            curveLabel.text = springView.curve
            durationLabel.text = string(from: springView.duration)
            dampingLabel.text = string(from: springView.damping)
            velocityLabel.text = string(from: springView.velocity)
        }
    }
    
    private func string(from value: CGFloat) -> String {
        String(format: "%.2f", value)
    }
}

