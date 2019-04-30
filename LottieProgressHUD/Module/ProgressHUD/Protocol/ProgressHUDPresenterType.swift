//
//  ProgressHUDPresenterType.swift
//  LottieProgressHUD
//
//  Created by Wipoo Shinsirikul on 30/4/19.
//  Copyright © 2019 King Power Click Co., Ltd. All rights reserved.
//

import Lottie
import UIKit

public protocol ProgressHUDPresenterType: class
{
    var backgroundColor: UIColor { get }
    
    var visualEffect: UIVisualEffect { get }
    var visualEffectCornerRadius: CGFloat { get }
    var visualEffectSizeOffset: UIOffset { get }
    
    var animation: Animation { get }
    
    var router: ProgressHUDRouterType { get }
    
    init(
        animation: Animation,
        backgroundColor: UIColor,
        visualEffect: UIVisualEffect,
        visualEffectCornerRadius: CGFloat,
        visualEffectSizeOffset: UIOffset,
        router: ProgressHUDRouterType)
}
