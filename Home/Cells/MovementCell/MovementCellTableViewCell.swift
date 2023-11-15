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
        self.selectionStyle = .none
        esercenteLabel.text = movement.esercente
        descriptionLabel.text = movement.descrizione
        let amount = movement.importo.formatDoubleToString(maximunFractionDigits: "%.2f")
        amountLabel.text = "\(amount)€"
        if(movement.importo < 0){
            amountLabel.textColor = .red
        }else{
            amountLabel.textColor = .green
        }
    }
}
