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
    
    // MARK: - Subviews
    
    private let contentView = UIView(frame: .zero)
    private let visualEffectView: UIVisualEffectView
    private let animationView: AnimationView
    
    // MARK: - Initializer
    
    required init(presenter: ProgressHUDPresenterType)
    {
        self.presenter = presenter
        
        visualEffectView = UIVisualEffectView(effect: self.presenter.visualEffect)
        animationView = AnimationView(animation: self.presenter.animation)
        
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
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = presenter.backgroundColor
        view.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = presenter.visualEffectCornerRadius
        contentView.clipsToBounds = true
        contentView.addSubview(visualEffectView)
        
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.contentView.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.loopMode = .loop
        
        NSLayoutConstraint
            .activate([
                contentView
                    .centerXAnchor
                    .constraint(
                        equalTo: view.centerXAnchor),
                contentView
                    .centerYAnchor
                    .constraint(
                        equalTo: view.centerYAnchor),
                contentView
                    .widthAnchor
                    .constraint(
                        equalTo: visualEffectView.widthAnchor),
                contentView
                    .heightAnchor
                    .constraint(
                        equalTo: visualEffectView.heightAnchor),
                visualEffectView
                    .centerXAnchor
                    .constraint(
                        equalTo: contentView.centerXAnchor),
                visualEffectView
                    .centerYAnchor
                    .constraint(
                        equalTo: contentView.centerYAnchor),
                visualEffectView
                    .widthAnchor
                    .constraint(
                        equalTo: animationView.widthAnchor,
                        constant: presenter.visualEffectSizeOffset.horizontal),
                visualEffectView
                    .heightAnchor
                    .constraint(
                        equalTo: animationView.heightAnchor,
                        constant: presenter.visualEffectSizeOffset.vertical),
                animationView
                    .centerXAnchor
                    .constraint(
                        equalTo: visualEffectView.centerXAnchor),
                animationView
                    .centerYAnchor
                    .constraint(
                        equalTo: visualEffectView.centerYAnchor),
                animationView
                    .widthAnchor
                    .constraint(
                        equalToConstant: presenter.animation.size.width),
                animationView
                    .heightAnchor
                    .constraint(
                        equalToConstant: presenter.animation.size.height) ])
        
        self.view = view
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        animationView.play()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        animationView.pause()
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        
        animationView.stop()
    }
}
