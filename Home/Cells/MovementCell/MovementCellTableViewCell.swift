//
//  MovementCellTableViewCell.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 14/11/23.
//

import UIKit

class MovementCellTableViewCell: UITableViewCell {

    
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var esercenteLabel: UILabel!
    
    
    func configure(movement : Movement){
        esercenteLabel.text = movement.esercente
        descriptionLabel.text = movement.descrizione
        amountLabel.text = movement.importo
        // MARK colore amount
    }
}
