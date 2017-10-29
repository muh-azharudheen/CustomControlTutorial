//
//  DeluxeButton.swift
//  DeluxeProject
//
//  Created by MS1 on 10/28/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import UIKit
@IBDesignable
final class DeluxeButton: UIControl{
    
    @IBInspectable
    public var pressedBackGroundColor : UIColor = #colorLiteral(red: 0.9981653094, green: 0, blue: 0.9724083543, alpha: 1)
    
    @IBInspectable
    public var unPressedBackGroundColor: UIColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) {
        didSet{
            backgroundColor = unPressedBackGroundColor
        }
    }
    
    fileprivate let imageView: UIImageView  = {
        let iv = UIImageView()
        iv.layer.masksToBounds = true
        iv.isUserInteractionEnabled = false
        return iv
    }()
    
    fileprivate let label: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 40,
                                     weight: UIFontWeightHeavy)
        lbl.textAlignment = .center
        lbl.layer.masksToBounds = true
        lbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    fileprivate lazy var stackView : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [self.imageView ,
                                                self.label])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.isUserInteractionEnabled = false
        sv.axis = .vertical
        return sv
    }()
    
    fileprivate var constant: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initPhase2()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initPhase2()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initPhase2()
    }
    
    private func initPhase2(){
        clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        label.backgroundColor = tintColor
        layer.borderColor = tintColor.cgColor
        layer.cornerRadius = 20
       
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
            label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
            ])
    }
    
    override func tintColorDidChange() {
        label.backgroundColor = tintColor
        layer.borderColor = tintColor.cgColor
    }
}

// Mark Pressed
extension DeluxeButton{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animate(isPressed: true)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animate(isPressed: false)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animate(isPressed: false)
    }
    
    private func animate(isPressed: Bool){
        let (duration, backGroundColor , labelIsHidden) = {
            isPressed ? (duration: 0.05, backgroundColor : pressedBackGroundColor , labelIsHidden : true) : (duration: 0.1 , backgroundColor: unPressedBackGroundColor , labelIsHidden : false)
        }()
        
        UIView.animate(withDuration: duration) {
            self.backgroundColor = backGroundColor
            self.label.isHidden = labelIsHidden
        }
    }
}


extension DeluxeButton{
    
    @IBInspectable
    var image : UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    @IBInspectable
    var text: String?{
        get {
            return label.text
        }
        set{
            label.text = newValue
        }
    }
    
    @IBInspectable
    var textColor: UIColor? {
        get {
            return label.textColor
        }
        set {
            label.textColor = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat{
        get {
            return layer.borderWidth
        }
        set {
            layoutMargins = UIEdgeInsets(
                top: newValue,
                left: newValue,
                bottom: newValue / 2 ,
                right: newValue
            )
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var imagePadding: CGFloat{
        get {
            return image?.alignmentRectInsets.top ?? 0
        }
        set {
            image = image?.withAlignmentRectInsets(UIEdgeInsets(top: -newValue,
                                                        left: -newValue,
                                                        bottom: -newValue,
                                                        right: -newValue))
        }
    }
}


