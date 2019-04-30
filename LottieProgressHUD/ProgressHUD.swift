//
//  ProgressHUD.swift
//  LottieProgressHUD
//
//  Created by Wipoo Shinsirikul on 30/4/19.
//  Copyright © 2019 King Power Click Co., Ltd. All rights reserved.
//

import Lottie
import UIKit

open class ProgressHUD
{
    private var animation: Animation?
    
    private static let singleton = ProgressHUD()
}

extension ProgressHUD
{
    public class func register(animation: Animation)
    {
        singleton.animation = animation
    }
}

extension ProgressHUD
{
    public class var defaultAnimation: Animation
    {
        guard let animation = ProgressHUD.singleton.animation else
        {
            fatalError("Default animation not registered by ProgressHUD")
        }
        
        return animation
    }
}

extension ProgressHUD
{
    open class func show(
        backgroundColor: UIColor = .clear,
        visualEffect: UIVisualEffect = UIBlurEffect(style: .prominent),
        visualEffectCornerRadius: CGFloat = 14.0,
        visualEffectSizeOffset: UIOffset = UIOffset(horizontal: 28.0, vertical: 28.0),
        animated flag: Bool = true,
        completion: (() -> Void)? = nil)
    {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else
        {
            return
        }
        
        if let presentedViewController = rootViewController.presentedViewController
        {
            guard (presentedViewController is (UIViewController & ProgressHUDViewType)) == false else
            {
                return
            }
            
            UIViewController
                .presentingViewController(
                    from: presentedViewController)
                .showProgressHUD(
                    backgroundColor: backgroundColor,
                    visualEffect: visualEffect,
                    visualEffectCornerRadius: visualEffectCornerRadius,
                    visualEffectSizeOffset: visualEffectSizeOffset,
                    animated: flag,
                    completion: completion)
        }
        else
        {
            rootViewController
                .showProgressHUD(
                    backgroundColor: backgroundColor,
                    visualEffect: visualEffect,
                    visualEffectCornerRadius: visualEffectCornerRadius,
                    visualEffectSizeOffset: visualEffectSizeOffset,
                    animated: flag,
                    completion: completion)
        }
    }
    
    open class func dismiss(
        animated flag: Bool = true,
        completion: (() -> Void)? = nil)
    {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else
        {
            completion?()
            
            return
        }
        
        dismiss(in: rootViewController, animated: flag, completion: completion)
    }
}

extension ProgressHUD
{
    private class func dismiss(
        in viewController: UIViewController,
        animated flag: Bool = true,
        completion: (() -> Void)? = nil)
    {
        if let presentedViewController = viewController.presentedViewController
        {
            if presentedViewController is (UIViewController & ProgressHUDViewType)
            {
                viewController.dismissProgressHUD(animated: flag, completion: completion)
            }
            else
            {
                dismiss(in: presentedViewController, animated: flag, completion: completion)
            }
        }
        else
        {
            completion?()
            
            return
        }
    }
}

private extension UIViewController
{
    class func presentingViewController(from viewController: UIViewController) -> UIViewController
    {
        if let presentedViewController = viewController.presentedViewController
        {
            return presentingViewController(from: presentedViewController)
        }
        else
        {
            return viewController
        }
    }
}
