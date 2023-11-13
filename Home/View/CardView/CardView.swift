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
        initialize()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func configure(card : Card){
        cardNameLabel.text = card.circuito
        //cardContainer.backgroundColor = UIColor()
    }
    
    func initialize(){
        let bundle = Bundle(for: CardView.self)
        bundle.loadNibNamed("CardView", owner: self, options: nil)
        
        style()
        layout()
        
    }
}

extension CardView {
    func style(){
        cardContainer.layer.cornerRadius = 8
    }
    
    func layout(){
        addSubview(contentView)
    }
}


