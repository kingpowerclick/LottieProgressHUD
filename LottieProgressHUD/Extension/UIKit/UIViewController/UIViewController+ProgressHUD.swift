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
        backgroundColor: UIColor? = ProgressHUD.backgroundColor,
        effect: UIVisualEffect? = ProgressHUD.effect,
        effectCornerRadius: CGFloat = ProgressHUD.effectCornerRadius,
        effectSizeOffset: UIOffset = ProgressHUD.effectSizeOffset,
        animated flag: Bool = true,
        completion: (() -> Void)? = nil)
    {
        let viewController = ProgressHUDBuilder
            .build(
                animation: animation,
                backgroundColor: backgroundColor,
                effect: effect,
                effectCornerRadius: effectCornerRadius,
                effectSizeOffset: effectSizeOffset)
        
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
