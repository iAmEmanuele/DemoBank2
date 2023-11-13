//
//  Extensions.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 13/11/23.
//

import UIKit


extension UIView {
    @discardableResult
    func loadfromNib<T : UIView>() -> T? {
        let bundle = Bundle(for: type(of: self))
        guard let view = bundle.loadNibNamed(String(describing: type(of: self)) , owner: self, options: nil)?[0] as? T else {
            return nil
        }
        addSubview(view)
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        return view
    }
    func setCornerRadius(_ radius : CGFloat = 5){
        self.layer.cornerRadius = radius
        clipsToBounds = true
    }
}
