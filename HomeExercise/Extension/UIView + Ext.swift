//
//  UIView + Ext.swift
//  HomeExercise
//
//  Created by Junaid on 12/07/2022.
//

import Lottie
import UIKit
extension UIView {
    
    func playAnimation(animationView: AnimationView,loopMode: LottieLoopMode = .loop, speed: CGFloat = 2) {
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = loopMode
        animationView.animationSpeed = speed
        animationView.play()
    }
}
