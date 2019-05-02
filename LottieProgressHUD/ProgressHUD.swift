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
    private var backgroundColor: UIColor? = .clear
    private var effect: UIVisualEffect? = UIBlurEffect(style: .prominent)
    private var effectCornerRadius: CGFloat = 14.0
    private var effectSizeOffset = UIOffset(horizontal: 28.0, vertical: 28.0)
    
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
    
    open class var backgroundColor: UIColor? {
        get { return singleton.backgroundColor }
        set { singleton.backgroundColor = newValue } }
    
    open class var effect: UIVisualEffect? {
        get { return singleton.effect }
        set { singleton.effect = newValue } }
    
    open class var effectCornerRadius: CGFloat {
        get { return singleton.effectCornerRadius }
        set { singleton.effectCornerRadius = newValue } }
    
    open class var effectSizeOffset: UIOffset {
        get { return singleton.effectSizeOffset }
        set { singleton.effectSizeOffset = newValue } }
}

extension ProgressHUD
{
    open class func show(
        backgroundColor: UIColor? = ProgressHUD.backgroundColor,
        effect: UIVisualEffect? = ProgressHUD.effect,
        effectCornerRadius: CGFloat = ProgressHUD.effectCornerRadius,
        effectSizeOffset: UIOffset = ProgressHUD.effectSizeOffset,
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
                    animation: ProgressHUD.defaultAnimation,
                    backgroundColor: backgroundColor,
                    effect: effect,
                    effectCornerRadius: effectCornerRadius,
                    effectSizeOffset: effectSizeOffset,
                    animated: flag,
                    completion: completion)
        }
        else
        {
            rootViewController
                .showProgressHUD(
                    animation: ProgressHUD.defaultAnimation,
                    backgroundColor: backgroundColor,
                    effect: effect,
                    effectCornerRadius: effectCornerRadius,
                    effectSizeOffset: effectSizeOffset,
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
