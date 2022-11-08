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
    
    let animation: LottieAnimation
    
    let backgroundColor: UIColor?
    
    let effect: UIVisualEffect?
    let effectCornerRadius: CGFloat
    let effectSizeOffset: UIOffset
    
    let tapContentHandler: (() -> Void)?
    let tapBackgroundHandler: (() -> Void)?
    
    var shouldAddTapGestureRecognizer: Bool { return (tapContentHandler ?? tapBackgroundHandler) != nil }
    
    // MARK: - Router
    
    let router: ProgressHUDRouterType
    
    // MARK: - Initializer
    
    required init(
        animation: LottieAnimation,
        backgroundColor: UIColor?,
        effect: UIVisualEffect?,
        effectCornerRadius: CGFloat,
        effectSizeOffset: UIOffset,
        tapContentHandler: (() -> Void)?,
        tapBackgroundHandler: (() -> Void)?,
        router: ProgressHUDRouterType)
    {
        self.animation = animation
        
        self.backgroundColor = backgroundColor
        
        self.effect = effect
        self.effectCornerRadius = effectCornerRadius
        self.effectSizeOffset = effectSizeOffset
        
        self.tapContentHandler = tapContentHandler
        self.tapBackgroundHandler = tapBackgroundHandler
        
        self.router = router
    }
}
