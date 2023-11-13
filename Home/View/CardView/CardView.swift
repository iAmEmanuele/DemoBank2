//
//  CardView.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 13/11/23.
//

import UIKit

class CardView : UIView {
    @IBOutlet var cardContainer: UIView!
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet var cardNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadfromNib()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadfromNib()
    }
    
    func configure(card : Card){
        style()
        cardNameLabel.text = card.circuito
        //cardContainer.backgroundColor = UIColor()
    }
    
}

extension CardView {
    func style(){
        cardContainer.setCornerRadius(8)
    }
    
}


