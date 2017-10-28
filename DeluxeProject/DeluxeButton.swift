//
//  DeluxeButton.swift
//  DeluxeProject
//
//  Created by MS1 on 10/28/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import UIKit
final class DeluxeButton: UIControl{
    
    fileprivate let imageView: UIImageView  = {
        let iv = UIImageView()
        iv.layer.masksToBounds = true
        iv.isUserInteractionEnabled = false
//        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    fileprivate lazy var outerView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = false
        return view
    } ()
    
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
        let sv = UIStackView(arrangedSubviews: [self.outerView ,
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
        
        imageView.frame = CGRect(x: constant, y: constant, width: self.outerView.frame.width - constant*2, height: self.outerView.frame.height - constant*2)
        outerView.addSubview(imageView)
    }
    
    override func tintColorDidChange() {
        label.backgroundColor = tintColor
        layer.borderColor = tintColor.cgColor
    }
}
extension DeluxeButton{
    var image : UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    var text: String?{
        get {
            return label.text
        }
        set{
            label.text = newValue
        }
    }
    
    var textColor: UIColor? {
        get {
            return label.textColor
        }
        set {
            label.textColor = newValue
        }
    }
    
    var borderWidth: CGFloat{
        get {
            return layer.borderWidth
        }
        set {
            layoutMargins = UIEdgeInsets(
                top: newValue,
                left: newValue,
                bottom: newValue / 2,
                right: newValue
            )
            layer.borderWidth = newValue
        }
    }
    
    var imagePadding: CGFloat{
        get {
            return constant
        }
        set {
            constant = newValue
        }
    }
}


