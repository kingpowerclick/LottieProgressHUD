//
//  ProgressHUDView.swift
//  LottieProgressHUD
//
//  Created by Wipoo Shinsirikul on 2/5/19.
//  Copyright © 2019 King Power Click Co., Ltd. All rights reserved.
//

import Lottie
import UIKit

class ProgressHUDView: UIView
{
    private let contentView = UIView(frame: .zero)
    private let visualEffectView: UIVisualEffectView
    private let animationView: AnimationView
    
    private let visualEffectSizeOffset: UIOffset
    
    init(
        frame: CGRect,
        animation: Animation,
        visualEffect: UIVisualEffect?,
        visualEffectCornerRadius: CGFloat,
        visualEffectSizeOffset: UIOffset)
    {
        visualEffectView = UIVisualEffectView(effect: visualEffect)
        animationView = AnimationView(animation: animation)
        
        self.visualEffectSizeOffset = visualEffectSizeOffset
        
        super.init(frame: frame)
        
        addSubview(contentView)
        
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = visualEffectCornerRadius
        contentView.clipsToBounds = true
        contentView.addSubview(visualEffectView)
        
        visualEffectView.contentView.addSubview(animationView)
        
        animationView.loopMode = .loop
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
                width: animation.size.width + visualEffectSizeOffset.horizontal,
                height: animation.size.height + visualEffectSizeOffset.vertical))
        contentView.center = CGPoint(
            x: bounds.midX,
            y: bounds.midY)
        
        visualEffectView.frame = contentView.bounds
        
        animationView.frame = CGRect(
            origin: CGPoint(
                x: visualEffectSizeOffset.horizontal * 0.5,
                y: visualEffectSizeOffset.vertical * 0.5),
            size: animation.size)
    }
}

extension ProgressHUDView
{
    func play()
    {
        animationView.play()
    }
    
    func pause()
    {
        animationView.pause()
    }
    
    func stop()
    {
        animationView.stop()
    }
}
