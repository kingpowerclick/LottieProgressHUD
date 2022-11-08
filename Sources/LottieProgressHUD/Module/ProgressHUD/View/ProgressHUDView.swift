//
//  ProgressHUDView.swift
//  LottieProgressHUD
//
//  Created by Wipoo Shinsirikul on 2/5/19.
//  Copyright © 2019 King Power Click Co., Ltd. All rights reserved.
//

import Lottie
import UIKit

class ProgressHUDView: UIView, ProgressHUDViewType
{
    private let contentView = UIView(frame: .zero)
    private let visualEffectView: UIVisualEffectView
    private let animationView: LottieAnimationView
    
    private lazy var tapGestureRecognizer = { return UITapGestureRecognizer(target: self, action: #selector(tapGestureDidRecognize(_:))) }()
    
    // MARK: - Presenter
    
    let presenter: ProgressHUDPresenterType
    
    // MARK: - Initializer
    
    required init(presenter: ProgressHUDPresenterType)
    {
        self.presenter = presenter
        
        visualEffectView = UIVisualEffectView(effect: self.presenter.effect)
        animationView = LottieAnimationView(animation: self.presenter.animation)
        
        super.init(frame: UIScreen.main.bounds)
        
        backgroundColor = self.presenter.backgroundColor
        
        addSubview(contentView)
        
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = self.presenter.effectCornerRadius
        contentView.clipsToBounds = true
        contentView.addSubview(visualEffectView)
        
        visualEffectView.contentView.addSubview(animationView)
        
        if self.presenter.shouldAddTapGestureRecognizer
        {
            addGestureRecognizer(tapGestureRecognizer)
        }
        
        animationView.loopMode = .loop
        
        accessibilityIdentifier = "ProgressHUD"
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        guard let animation = animationView.animation else
        {
            return
        }
        
        contentView.frame = CGRect(
            origin: .zero,
            size: CGSize(
                width: animation.size.width + presenter.effectSizeOffset.horizontal,
                height: animation.size.height + presenter.effectSizeOffset.vertical))
        contentView.center = CGPoint(
            x: bounds.midX,
            y: bounds.midY)
        
        visualEffectView.frame = contentView.bounds
        
        animationView.frame = CGRect(
            origin: CGPoint(
                x: presenter.effectSizeOffset.horizontal * 0.5,
                y: presenter.effectSizeOffset.vertical * 0.5),
            size: animation.size)
    }
    
    override func willMove(toSuperview newSuperview: UIView?)
    {
        super.willMove(toSuperview: newSuperview)
        
        guard newSuperview != nil else
        {
            return
        }
        
        animationView.play()
    }
    
    override func removeFromSuperview()
    {
        super.removeFromSuperview()
        
        animationView.stop()
    }
    
    // MARK: - Selector
    
    @objc
    private func tapGestureDidRecognize(_ sender: UITapGestureRecognizer)
    {
        guard presenter.shouldAddTapGestureRecognizer,
              sender.view != nil else
        {
            return
        }
        
        let point = tapGestureRecognizer.location(in: sender.view)
        
        if contentView.frame.contains(point)
        {
            presenter.tapContentHandler?()
        }
        else
        {
            presenter.tapBackgroundHandler?()
        }
    }
}
