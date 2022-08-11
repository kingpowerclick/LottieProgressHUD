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
        animation: Animation = ProgressHUD.defaultAnimation,
        backgroundColor: UIColor? = ProgressHUD.backgroundColor,
        effect: UIVisualEffect? = ProgressHUD.effect,
        effectCornerRadius: CGFloat = ProgressHUD.effectCornerRadius,
        effectSizeOffset: UIOffset = ProgressHUD.effectSizeOffset,
        tapInsideHUDHandler: (() -> Void)?,
        tapOutsideHUDHandler: (() -> Void)?) -> (UIView & ProgressHUDViewType)
    {
        let router = ProgressHUDRouter()
        
        let presenter = ProgressHUDPresenter(
            animation: animation,
            backgroundColor: backgroundColor,
            effect: effect,
            effectCornerRadius: effectCornerRadius,
            effectSizeOffset: effectSizeOffset,
            tapInsideHUDHandler: tapInsideHUDHandler,
            tapOutsideHUDHandler: tapOutsideHUDHandler,
            router: router)
        
        let view = ProgressHUDView(presenter: presenter)
        
        return view
    }
}
