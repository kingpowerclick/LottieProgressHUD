//
//  ProgressHUDBuilderType.swift
//  LottieProgressHUD
//
//  Created by Wipoo Shinsirikul on 30/4/19.
//  Copyright © 2019 King Power Click Co., Ltd. All rights reserved.
//

import Lottie
import UIKit

public protocol ProgressHUDBuilderType: AnyObject
{
    static func build(
        animation: Animation,
        backgroundColor: UIColor?,
        effect: UIVisualEffect?,
        effectCornerRadius: CGFloat,
        effectSizeOffset: UIOffset,
        tapInsideHUDHandler: (() -> Void)?,
        tapOutsideHUDHandler: (() -> Void)?) -> (UIView & ProgressHUDViewType)
}
