//
//  MovementView.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 14/11/23.
//

import UIKit

class MovementView : UIView {
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var merchantLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize(){
        loadfromNib()
//        style()
//        layout()
    }
    
    func configure(movement : Movement){
        merchantLabel.text = movement.esercente
        descriptionLabel.text = movement.descrizione
        amountLabel.text = movement.importo
        // MARK: controllare importo per il colore
    
    }
}
