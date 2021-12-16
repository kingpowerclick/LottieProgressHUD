//
//  ProgressHUDViewType.swift
//  LottieProgressHUD
//
//  Created by Wipoo Shinsirikul on 30/4/19.
//  Copyright © 2019 King Power Click Co., Ltd. All rights reserved.
//

import UIKit

public protocol ProgressHUDViewType: AnyObject
{
    var presenter: ProgressHUDPresenterType { get }
    
    init(presenter: ProgressHUDPresenterType)
}
