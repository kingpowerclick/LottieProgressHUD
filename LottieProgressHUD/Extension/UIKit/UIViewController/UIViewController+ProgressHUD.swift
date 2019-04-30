//
//  UIViewController+ProgressHUD.swift
//  LottieProgressHUD
//
//  Created by Wipoo Shinsirikul on 30/4/19.
//  Copyright © 2019 King Power Click Co., Ltd. All rights reserved.
//

import Lottie
import UIKit

extension UIViewController
{
    open func showProgressHUD(
        animation: Animation = ProgressHUD.defaultAnimation,
        backgroundColor: UIColor = .clear,
        visualEffect: UIVisualEffect = UIBlurEffect(style: .prominent),
        visualEffectCornerRadius: CGFloat = 14.0,
        visualEffectSizeOffset: UIOffset = UIOffset(horizontal: 28.0, vertical: 28.0),
        animated flag: Bool = true,
        completion: (() -> Void)? = nil)
    {
        let viewController = ProgressHUDBuilder
            .build(
                animation: animation,
                backgroundColor: backgroundColor,
                visualEffect: visualEffect,
                visualEffectCornerRadius: visualEffectCornerRadius,
                visualEffectSizeOffset: visualEffectSizeOffset)
        
        present(
            viewController,
            animated: flag,
            completion: completion)
    }
    
    open func dismissProgressHUD(
        animated flag: Bool = true,
        completion: (() -> Void)? = nil)
    {
        guard presentedViewController is (UIViewController & ProgressHUDViewType) else
        {
            completion?()
            
            return
        }
        
        dismiss(animated: flag, completion: completion)
    }
}
