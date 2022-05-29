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
    
    let backgroundColor: UIColor?
    
    let effect: UIVisualEffect?
    var effectCornerRadius: CGFloat
    var effectSizeOffset: UIOffset
    let onTap: (() -> Void)?
    
    // MARK: - Router
    
    let router: ProgressHUDRouterType
    
    // MARK: - Initializer
    
    required init(
        animation: Animation,
        backgroundColor: UIColor?,
        effect: UIVisualEffect?,
        effectCornerRadius: CGFloat,
        effectSizeOffset: UIOffset,
        onTap: (() -> Void)?,
        router: ProgressHUDRouterType)
    {
        self.animation = animation
        
        self.backgroundColor = backgroundColor
        
        self.effect = effect
        self.effectCornerRadius = effectCornerRadius
        self.effectSizeOffset = effectSizeOffset
        self.onTap = onTap
        
        self.router = router
    }
}
