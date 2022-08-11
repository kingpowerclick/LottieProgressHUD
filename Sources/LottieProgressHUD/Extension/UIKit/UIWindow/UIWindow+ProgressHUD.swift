//
//  UIWindow+ProgressHUD.swift
//  LottieProgressHUD
//
//  Created by Wipoo Shinsirikul on 30/4/19.
//  Copyright © 2019 King Power Click Co., Ltd. All rights reserved.
//

import Lottie
import UIKit

extension UIWindow
{
    @MainActor
    public func showProgressHUD(
        animation: Animation = ProgressHUD.defaultAnimation,
        backgroundColor: UIColor? = ProgressHUD.backgroundColor,
        effect: UIVisualEffect? = ProgressHUD.effect,
        effectCornerRadius: CGFloat = ProgressHUD.effectCornerRadius,
        effectSizeOffset: UIOffset = ProgressHUD.effectSizeOffset,
        tapContentHandler: (() -> Void)? = ProgressHUD.tapContentHandler,
        tapBackgroundHandler: (() -> Void)? = ProgressHUD.tapBackgroundHandler,
        animated flag: Bool = true,
        completion: ((Bool) -> Void)? = nil)
    {
        guard subviews.contains(where: { $0 is ProgressHUDViewType }) == false else
        {
            completion?(false)
            
            return
        }
        
        let view = ProgressHUDBuilder
            .build(
                animation: animation,
                backgroundColor: backgroundColor,
                effect: effect,
                effectCornerRadius: effectCornerRadius,
                effectSizeOffset: effectSizeOffset,
                tapContentHandler: tapContentHandler,
                tapBackgroundHandler: tapBackgroundHandler)
        
        if flag
        {
            view.alpha = 0.0
            
            addSubview(view)
            
            UIView
                .animate(
                    withDuration: 1.0 / .pi,
                    animations: { [weak view] in
                        view?.alpha = 1.0 },
                    completion: completion)
        }
        else
        {
            addSubview(view)
            
            completion?(false)
        }
    }
    
    @MainActor
    public func dismissProgressHUD(
        animated flag: Bool = true,
        completion: ((Bool) -> Void)? = nil)
    {
        guard let view = subviews.last(where: { $0 is (UIView & ProgressHUDViewType) }) else
        {
            completion?(false)
            
            return
        }
        
        if flag
        {
            UIView
                .animate(
                    withDuration: 1.0 / .pi,
                    animations: { [weak view] in
                        view?.alpha = 0.0 },
                    completion: { [weak view] finished in
                        view?.removeFromSuperview()
                        completion?(finished) })
        }
        else
        {
            view.removeFromSuperview()
            
            completion?(false)
        }
    }
}
