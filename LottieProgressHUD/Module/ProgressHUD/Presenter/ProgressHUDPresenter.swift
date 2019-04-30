//
//  ProgressHUDPresenter.swift
//  LottieProgressHUD
//
//  Created by Wipoo Shinsirikul on 30/4/19.
//  Copyright © 2019 King Power Click Co., Ltd. All rights reserved.
//

import Lottie
import UIKit

class ProgressHUDPresenter: ProgressHUDPresenterType
{
    // MARK: -
    
    let animation: Animation
    
    let backgroundColor: UIColor
    
    let visualEffect: UIVisualEffect
    var visualEffectCornerRadius: CGFloat
    var visualEffectSizeOffset: UIOffset
    
    // MARK: - Router
    
    let router: ProgressHUDRouterType
    
    // MARK: - Initializer
    
    required init(
        animation: Animation,
        backgroundColor: UIColor,
        visualEffect: UIVisualEffect,
        visualEffectCornerRadius: CGFloat,
        visualEffectSizeOffset: UIOffset,
        router: ProgressHUDRouterType)
    {
        self.animation = animation
        
        self.backgroundColor = backgroundColor
        
        self.visualEffect = visualEffect
        self.visualEffectCornerRadius = visualEffectCornerRadius
        self.visualEffectSizeOffset = visualEffectSizeOffset
        
        self.router = router
    }
}
