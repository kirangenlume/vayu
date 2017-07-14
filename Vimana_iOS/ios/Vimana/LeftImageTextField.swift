//
//  LeftImageTextField.swift
//  mPOS_Swift
//
//  Created by Jenkins on 3/6/17.
//  Copyright © 2017 Enlume. All rights reserved.
//

import UIKit;

@IBDesignable class LeftImageTextField: UITextField {

    @IBInspectable var image: UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var rightPadding: CGFloat = 5 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var editable: Bool = true {
        didSet{
            isEnabled = editable
        }
    }

    func updateView() {
        if let image = image {
            leftViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 11, y: 11, width: 15, height: 15))
            imageView.image = image
            
            let mainView = UIView(frame: CGRect(x: 0, y: 0, width: imageView.frame.size.width + rightPadding, height: 40))
            mainView.addSubview(imageView)
            
            
            leftView = mainView
        } else {
            leftViewMode = UITextFieldViewMode.never
            leftView = nil
        }
    }
 
}
