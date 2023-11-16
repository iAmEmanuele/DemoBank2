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
        
    }
}


extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            var hexColor = String(hex[start...]).uppercased()
            
            if hexColor.count == 6 {
                hexColor = "\(hexColor)FF"
            }
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}


extension Double {
    func formatDoubleToString(maximunFractionDigits : String) -> String{
        return String(format: maximunFractionDigits, self)
    }
}


extension UIViewController {
    func showAlertDialog(title : String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel))
        self.present(alert,animated: true)
        
    }
}
