//
//  MovementCell.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 14/11/23.
//

import UIKit

class MovementCell : UITableViewCell{
    let movementView = MovementView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        style()
        layout()
    }
    
    func configure(movement: Movement) {
        movementView.configure(movement: movement)
    }
    
    
}

extension MovementCell {
    func style() {
        movementView.translatesAutoresizingMaskIntoConstraints = false
    }
    func layout(){
        contentView.addSubview(movementView)
        NSLayoutConstraint.activate([
            movementView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            movementView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            movementView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            movementView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20)
        ])
    }
}
