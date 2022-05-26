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
    private var maxSupportedWindowLevel: UIWindow.Level = .normal
    
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
    
    open class var maxSupportedWindowLevel: UIWindow.Level {
        get { return singleton.maxSupportedWindowLevel }
        set { singleton.maxSupportedWindowLevel = newValue } }
}

extension ProgressHUD
{
    private class var frontWindow: UIWindow?
    {
        return UIApplication
            .shared
            .windows
            .last {
                $0.screen == UIScreen.main
                    && $0.isHidden == false
                    && $0.alpha > 0.0
                    && UIWindow.Level.normal...maxSupportedWindowLevel ~= $0.windowLevel
                    && $0.isKeyWindow }
    }
    
    @MainActor
    open class func show(
        backgroundColor: UIColor? = ProgressHUD.backgroundColor,
        effect: UIVisualEffect? = ProgressHUD.effect,
        effectCornerRadius: CGFloat = ProgressHUD.effectCornerRadius,
        effectSizeOffset: UIOffset = ProgressHUD.effectSizeOffset,
        animated flag: Bool = true,
        completion: ((Bool) -> Void)? = nil)
    {
        guard let window = frontWindow else
        {
            return
        }
        window
            .showProgressHUD(
                animation: ProgressHUD.defaultAnimation,
                backgroundColor: backgroundColor,
                effect: effect,
                effectCornerRadius: effectCornerRadius,
                effectSizeOffset: effectSizeOffset,
                animated: flag,
                completion: completion)
    }
    
    @MainActor
    open class func dismiss(
        animated flag: Bool = true,
        completion: ((Bool) -> Void)? = nil)
    {
        guard let window = frontWindow else
        {
            return
        }
        
        window
            .dismissProgressHUD(
                animated: flag,
                completion: completion)
    }
}
