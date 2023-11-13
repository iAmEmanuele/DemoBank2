//
//  CardView.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 13/11/23.
//

import UIKit

class CardView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize(){
        let bundle = Bundle(for: CardView.self)
        bundle.loadNibNamed("CardView", owner: self, options: nil)
        
    }
}
