//
//  HomeCell.swift
//  NextStone
//
//  Created by Mobile on 30/03/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

protocol TopBarDelegate {
    func backButtonClicked()
}

@IBDesignable
open class TopBarView: UIView {
    
    static let shared = TopBarView()
    var rightButtonAction = String()
    
    
    //STORE VARIABLE
    var count = 1
    var delegate: TopBarDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    @IBInspectable
    public var backButtonImage: UIImage = UIImage() {
        didSet {
            backButton.setImage(backButtonImage, for: .normal)
        }
    }
    
    
    @IBInspectable
    public var Title: String = String() {
        didSet {
            titleLabel.text = Title
        }
    }
    
    
    @IBInspectable
    public var showBackButton: Bool = true {
        didSet {
            backButton.isHidden = !showBackButton
        }
    }
    
    @IBInspectable
    public var showBorder: Bool = true {
        didSet {
            lineView.isHidden = !showBorder
        }
    }
    
    func initViews() {
        addSubviews([backButton, lineView, titleLabel])
    }
    
    // MARK: - Setter getter methods
    
    var _backButton: UIButton!
    var backButton: UIButton {
        get {
            if _backButton == nil {
                _backButton = UIButton(type: .custom)
                _backButton.touchUpInsideBlock({
                    print(String(describing:self.backButton.image))
                    if self.backButton.hasImage(named: "menu", for: .normal) {
                        ActionShowSliderMenu.execute()
                    } else {
                        ActionBack.execute()
                    }
                })
            }
            return _backButton
        }
        set {
            _backButton = newValue
        }
    }
    
    
    
    var _lineView: BorderLineView!
    var lineView: BorderLineView {
        get {
            if _lineView == nil {
                _lineView = BorderLineView()
            }
            return _lineView
        }
        set {
            _lineView = newValue
        }
    }
    
    
    var _titleLabel: UILabel!
    var titleLabel: UILabel! {
        get {
            if _titleLabel == nil {
                _titleLabel = UILabel()
                _titleLabel.textColor = Constants.THEME_COLOR
                _titleLabel.font = UIFont(name: "Roboto-Roboto-Regular_5.ttf", size: 17.0)
            }
            return _titleLabel
        }
        set {
            _titleLabel = newValue
        }
    }
    
    // MARK: - Layout methods
    override open func layoutSubviews() {
        super.layoutSubviews()
        let subviews: [String: UIView] = ["back": backButton, "line": lineView, "title": titleLabel]
        addVisualConstraints(["H:|-10-[back]","V:|[back]|","V:[line]|", "H:|[line]|"], subviews: subviews)
        addConstraintSameCenterXY(self, and: titleLabel)
        _ = backButton.addConstraintForAspectRatio(1.0)
    }
    
    func backButtonClicked() {
    }
}
