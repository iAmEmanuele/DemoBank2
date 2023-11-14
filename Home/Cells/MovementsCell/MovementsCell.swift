//
//  MovementsCell.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 14/11/23.
//

import UIKit

class MovementsCell : UITableViewCell{
    let tableView = UITableView()
    let reuseId = "movementCell"
    var movements : [Movement] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        layout()
    }
    
    func configure(temp : [Movement]){
        movements = temp
    }
}

extension MovementsCell {
    func initialize(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovementCell.self, forCellReuseIdentifier: reuseId)
    }
    func layout(){
        contentView.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            tableView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}

extension MovementsCell : UITableViewDelegate {}

extension MovementsCell : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! MovementCell
        //cell.textLabel?.text =  movements[indexPath.row].esercente
        cell.configure(movement: movements[indexPath.row])
        return cell
    }
}
