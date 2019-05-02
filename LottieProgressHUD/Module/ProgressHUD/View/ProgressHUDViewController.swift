//
//  ProgressHUDViewController.swift
//  LottieProgressHUD
//
//  Created by Wipoo Shinsirikul on 30/4/19.
//  Copyright © 2019 King Power Click Co., Ltd. All rights reserved.
//

import Lottie
import UIKit

class ProgressHUDViewController: UIViewController, ProgressHUDViewType
{
    // MARK: - Presenter
    
    let presenter: ProgressHUDPresenterType
    
    // MARK: - Initializer
    
    required init(presenter: ProgressHUDPresenterType)
    {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View's Life Cycle
    
    override func loadView()
    {
        let view = ProgressHUDView(
            frame: UIScreen.main.bounds,
            animation: presenter.animation,
            visualEffect: presenter.effect,
            visualEffectCornerRadius: presenter.effectCornerRadius,
            visualEffectSizeOffset: presenter.effectSizeOffset)
        
        view.backgroundColor = presenter.backgroundColor
        
        self.view = view
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        (view as? ProgressHUDView)?.play()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        (view as? ProgressHUDView)?.pause()
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        
        (view as? ProgressHUDView)?.stop()
    }
}
