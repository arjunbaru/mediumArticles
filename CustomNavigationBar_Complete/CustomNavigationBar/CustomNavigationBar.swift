//
//  CustomNavigationBar.swift
//  CustomNavigationBar
//
//  Created by Arjun Baru on 10/05/20.
//  Copyright © 2020 Arjun Baru. All rights reserved.
//

import UIKit
import TinyConstraints

public enum AnimationStyle {
    case leftToCenter
}

class CustomNavigationBar: UIView {
    let animatingView: UIView
    let animationStyle: AnimationStyle

    init(animatingView: UIView, animationStyle: AnimationStyle = .leftToCenter) {
        self.animatingView = animatingView
        self.animationStyle = animationStyle
        super.init(frame: .zero)

        setupUI()
    }

    private let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        button.alpha = 0
        return button
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomNavigationBar {
    
    func setupUI() {
        addSubview(animatingView)
        addSubview(infoButton)


        infoButton.rightToSuperview(offset: -16)
        infoButton.topToSuperview(offset: 16)

        adjustTitleView()
    }

    func adjustTitleView() {
        switch animationStyle {
        case .leftToCenter:
            animatingView.leftToSuperview(offset: 16)
            animatingView.centerYToSuperview()
            animatingView.heightToSuperview()
        }
    }
}

extension CustomNavigationBar {
    public func animateInRelationTo(value: CGFloat) {
        switch animationStyle {
        case .leftToCenter:
            let maximumOffsetValue = max(value, 16)
            self.infoButton.alpha = min(value/100, 1)
            let translationX = min(maximumOffsetValue, (UIScreen.main.bounds.width/2 - self.animatingView.frame.width/2))
            self.animatingView.transform = CGAffineTransform(translationX: translationX - 16, y: 0)
        }
    }
}

