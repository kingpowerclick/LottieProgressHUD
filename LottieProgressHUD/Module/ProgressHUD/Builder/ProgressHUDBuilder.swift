//
//  ProgressHUDBuilder.swift
//  LottieProgressHUD
//
//  Created by Wipoo Shinsirikul on 30/4/19.
//  Copyright © 2019 King Power Click Co., Ltd. All rights reserved.
//

import Lottie
import UIKit

open class ProgressHUDBuilder: ProgressHUDBuilderType
{
    public static func build(
        animation: Animation,
        backgroundColor: UIColor = .clear,
        visualEffect: UIVisualEffect = UIBlurEffect(style: .prominent),
        visualEffectCornerRadius: CGFloat = 14.0,
        visualEffectSizeOffset: UIOffset = UIOffset(horizontal: 28.0, vertical: 28.0)) -> (UIViewController & ProgressHUDViewType)
    {
        let router = ProgressHUDRouter()
        
        let presenter = ProgressHUDPresenter(
            animation: animation,
            backgroundColor: backgroundColor,
            visualEffect: visualEffect,
            visualEffectCornerRadius: visualEffectCornerRadius,
            visualEffectSizeOffset: visualEffectSizeOffset,
            router: router)
        
        let viewController = ProgressHUDViewController(presenter: presenter)
        
        return viewController
    }
}
