//
//  ErrorView.swift
//  HomeExercise
//
//  Created by Junaid on 12/07/2022.
//

import UIKit
import Lottie
class ErrorView: UIView {
    
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var retryButton: UIButton!
    var retryNetworkRequest: (()->())?
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        roundedButtonWithBorder()
    }

    private func initView() {
        let nibView = Bundle.main.loadNibNamed("ErrorView", owner: self)
        if let errorView = nibView?.first as? UIView {
            errorView.frame = self.bounds
            addSubview(errorView)
            playAnimation(animationView: animationView)
        }
}
    @IBAction func retryButtonDidTapped(_ sender: Any) {
        retryNetworkRequest?()
    }

    private func roundedButtonWithBorder() {
        retryButton.layer.cornerRadius = 10
        retryButton.layer.borderColor = #colorLiteral(red: 0.2367406189, green: 0.7596899867, blue: 0.4115455151, alpha: 1)
        retryButton.layer.borderWidth = 2
        retryButton.backgroundColor = .clear
    }
}
