//
//  AnimationWrapper.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//

import Foundation
import UIKit
import Lottie

/// This reusable function will help us center-wrap a lottie animation inside an UIView
class AnimationWrapper {
    class func setUpAnimation(in container: UIView, withFile name: String, repeatMode:Float = .infinity){
        
        // Find the current animation and delete it
        if let currentAnimation = container.subviews.first {
            currentAnimation.removeFromSuperview()
        }
        
        // Proceed to create the new animation
        let animationJSONName = name
        let animation = Animation.named(animationJSONName)
        let animationView = AnimationView(animation: animation)
        let containerWidth = container.bounds.size.width
        let containerHeight = container.bounds.size.height
        let minSide = min(containerWidth, containerHeight)
        
        container.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: minSide),
            animationView.heightAnchor.constraint(equalToConstant: minSide)
        ])
        
        // Start the animation
        animationView.loopMode = .repeat(repeatMode)
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
    }
}

