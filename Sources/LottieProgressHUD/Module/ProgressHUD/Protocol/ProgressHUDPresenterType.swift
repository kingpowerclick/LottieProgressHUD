//
//  ProgressHUDPresenterType.swift
//  LottieProgressHUD
//
//  Created by Wipoo Shinsirikul on 30/4/19.
//  Copyright © 2019 King Power Click Co., Ltd. All rights reserved.
//

import Lottie
import UIKit

public protocol ProgressHUDPresenterType: AnyObject
{
    var backgroundColor: UIColor? { get }
    
    var effect: UIVisualEffect? { get }
    var effectCornerRadius: CGFloat { get }
    var effectSizeOffset: UIOffset { get }
    
    var tapContentHandler: (() -> Void)? { get }
    var tapBackgroundHandler: (() -> Void)? { get }
    var shouldAddTapGestureRecognizer: Bool { get }
    
    var animation: LottieAnimation { get }
    
    var router: ProgressHUDRouterType { get }
    
    init(
        animation: LottieAnimation,
        backgroundColor: UIColor?,
        effect: UIVisualEffect?,
        effectCornerRadius: CGFloat,
        effectSizeOffset: UIOffset,
        tapContentHandler: (() -> Void)?,
        tapBackgroundHandler: (() -> Void)?,
        router: ProgressHUDRouterType)
}
