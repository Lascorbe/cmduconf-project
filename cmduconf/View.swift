//
//  View.swift
//  cmduconf
//
//  Created by Luis Ascorbe Martínez on 06/07/16.
//  Copyright © 2016 @lascorbe. All rights reserved.
//

import UIKit
import QuartzCore
import Cartography

protocol ViewDelegate: class {
    func viewButtonPressed(fromView: View)
}

class View: UIView {
    
    weak var delegate: ViewDelegate?
    
    var titleText = "📸 Test your UI!" {
        didSet {
            titleLabel.text = titleText
        }
    }
    var bodyText = "UI testing means verifying that we do not break what we designed, and developed." {
        didSet {
            textLabel.text = bodyText
        }
    }
    var buttonText = "CMD+U" {
        didSet {
            button.setTitle(buttonText, forState: UIControlState.Normal)
        }
    }
    
    static private let contentViewMaxWidth: CGFloat = 340 // Max width the `contentView` could have
    static private let logoWidth: CGFloat = 60
    static private let logoHeight: CGFloat = 60
    static private let buttonHeight: CGFloat = 44
    
    private let contentView = UIView()
    private let titleView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFontOfSize(26.0)
        label.textColor = Color.blackColor
        return label
    }()
    
    private let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cmduconf")
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(18.0)
        label.textColor = Color.lightGrayColor
        label.numberOfLines = 0
        label.textAlignment = .Center
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .Custom)
        let backgroundNormalImage = UIImage(color: Color.mainColor)
        button.setBackgroundImage(backgroundNormalImage, forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(18.0)
        button.layer.cornerRadius = 10.0
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: -
    // MARK: Init
    
    init(delegate: ViewDelegate) {
        self.delegate = delegate
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View setup
    
    private func setup() {
        backgroundColor = UIColor.whiteColor()
        
        titleLabel.text = titleText
        textLabel.text = bodyText
        button.setTitle(buttonText, forState: UIControlState.Normal)
        
        titleView.addSubview(titleLabel)
        titleView.addSubview(logo)
        contentView.addSubview(titleView)
        contentView.addSubview(textLabel)
        contentView.addSubview(button)
        addSubview(contentView)
        
        button.addTarget(self, action: #selector(View.buttonPressed), forControlEvents: .TouchUpInside)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        constrain(titleView, titleLabel, logo, textLabel, button) { titleView, titleLabel, logo, textLabel, button in
            titleView.top == titleView.superview!.top
            titleView.centerX == titleView.superview!.centerX
            
            titleLabel.top == titleLabel.superview!.top
            titleLabel.leading == titleLabel.superview!.leading
            
            titleLabel.trailing == logo.leading - 4
            titleLabel.height == logo.height
            
            logo.top == logo.superview!.top + 1
            logo.trailing == logo.superview!.trailing
            logo.width == View.logoWidth
            logo.height == View.logoHeight
            logo.bottom == logo.superview!.bottom
            
            textLabel.top == titleView.bottom + 6
            textLabel.centerX == textLabel.superview!.centerX
            textLabel.width <= textLabel.superview!.width
            
            button.top == textLabel.bottom + 8
            button.height == View.buttonHeight
            button.leading == button.superview!.leading - 4
            button.trailing == button.superview!.trailing + 4
            button.bottom == button.superview!.bottom
        }
        
        constrain(contentView) { contentView in
            contentView.leading == contentView.superview!.leading + 8
            contentView.trailing == contentView.superview!.trailing - 8
            contentView.width <= View.contentViewMaxWidth
            contentView.centerY == contentView.superview!.centerY
        }
    }
    
    // MARK: Action
    
    func buttonPressed() {
        delegate?.viewButtonPressed(self)
    }
}
