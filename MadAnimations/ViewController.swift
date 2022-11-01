//
//  ViewController.swift
//  MadAnimations
//
//  Created by Aleksandr Mayyura on 31.10.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var dampingLabel: UILabel!
    @IBOutlet var velocityLabel: UILabel!
    
    @IBOutlet var animatedView: SpringView!
    
    private var nowAnimate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedView.layer.cornerRadius = 10
        startAnimation()
    }

    @IBAction func animatedViewTapped(_ sender: UIButton) {
        animatedView.animation = nowAnimate
        
        let randomAnimate = Animations.getAnimations()
        animatedView.curve = randomAnimate.curve
        animatedView.duration = randomAnimate.duration
        animatedView.damping = randomAnimate.damping
        animatedView.velocity = randomAnimate.velocity
        animatedView.animate()
        
        getValueFromLabels()
        
        nowAnimate = randomAnimate.preset
        sender.setTitle("Run \(nowAnimate)", for: .normal)
    }
    
    private func startAnimation() {
        let animations = Animations.getAnimations()
        nowAnimate = animations.preset
        presetLabel.text = animations.preset
        curveLabel.text = animations.curve
        durationLabel.text = string(from: animations.duration)
        dampingLabel.text = string(from: animations.damping)
        velocityLabel.text = string(from: animations.velocity)
    }

    private func getValueFromLabels() {
        presetLabel.text = animatedView.animation
        curveLabel.text = animatedView.curve
        durationLabel.text = string(from: animatedView.duration)
        dampingLabel.text = string(from: animatedView.damping)
        velocityLabel.text = string(from: animatedView.velocity)
    }

    private func string(from value: CGFloat) -> String {
        String(format: "%.2f", value)
    }

}

