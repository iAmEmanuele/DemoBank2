//
//  CardCell.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 13/11/23.
//

import UIKit

class CardCell: UICollectionViewCell {
    let cardView = CardView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        style()
        layout()
    }
    
    func configure(card : Card){
        cardView.configure(card: card)
    }
}

extension CardCell {
    func style(){
        cardView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout()  {
        contentView.addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
