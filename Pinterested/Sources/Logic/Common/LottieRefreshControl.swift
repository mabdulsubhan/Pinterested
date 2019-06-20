//
//  LottieRefreshControl.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 19/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit
import Lottie

class LottieRefreshControl: UIRefreshControl {
    fileprivate let animationView = AnimationView(name: "Loader")
    fileprivate var isAnimating = false
    
    fileprivate let maxPullDistance: CGFloat = 200
    
    override init() {
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupLayout()
    }
    
    func updateProgress(with offsetY: CGFloat) {
        guard !isAnimating else { return }
        let progress = min(abs(offsetY / maxPullDistance), 1)
        animationView.currentProgress = progress
    }
    
    override func beginRefreshing() {
        super.beginRefreshing()
        isAnimating = true
        animationView.currentProgress = 0
        animationView.play()
    }
    
    override func endRefreshing() {
        super.endRefreshing()
        animationView.stop()
        isAnimating = false
    }
}

private extension LottieRefreshControl {
    func setupView() {
        // hide default indicator view
        tintColor = .clear
        animationView.loopMode = .loop
        addSubview(animationView)
        
        addTarget(self, action: #selector(beginRefreshing), for: .valueChanged)
    }
    
    func setupLayout() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: centerYAnchor),
            animationView.widthAnchor.constraint(equalTo: widthAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 150)
            ])
    }
}
