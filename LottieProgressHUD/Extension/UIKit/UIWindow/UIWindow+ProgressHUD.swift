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
    open func showProgressHUD(
        animation: Animation = ProgressHUD.defaultAnimation,
        backgroundColor: UIColor? = ProgressHUD.backgroundColor,
        effect: UIVisualEffect? = ProgressHUD.effect,
        effectCornerRadius: CGFloat = ProgressHUD.effectCornerRadius,
        effectSizeOffset: UIOffset = ProgressHUD.effectSizeOffset,
        animated flag: Bool = true,
        completion: ((Bool) -> Void)? = nil)
    {
        OperationQueue
            .main
            .addOperation { [weak self] in
                guard self?.subviews.contains(where: { $0 is ProgressHUDViewType }) == false else
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
                        effectSizeOffset: effectSizeOffset)
                
                if flag
                {
                    view.alpha = 0.0
                    
                    self?.addSubview(view)
                    
                    UIView
                        .animate(
                            withDuration: 1.0 / .pi,
                            animations: { [weak view] in
                                view?.alpha = 1.0 },
                            completion: completion)
                }
                else
                {
                    self?.addSubview(view)
                    
                    completion?(false)
                } }
    }
    
    open func dismissProgressHUD(
        animated flag: Bool = true,
        completion: ((Bool) -> Void)? = nil)
    {
        OperationQueue
            .main
            .addOperation { [weak self] in
                guard let view = self?.subviews.last(where: { $0 is (UIView & ProgressHUDViewType) }) else
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
                } }
    }
}
