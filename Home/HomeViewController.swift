//
//  ViewController.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 08/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let cardContainer = ProfileView(frame: .zero)
    let reuseID = "customCell"
    
    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        cardContainer.configure(mainIfo: MainInfo(nome: "Pippo", cognome: "", saldo: "350.12 €"))
        tableView.register(CardsCell.self, forCellReuseIdentifier: reuseID)
        
    }
    
    
}

extension HomeViewController {
    func style() {
        
        // cardContainer
        var size = cardContainer.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        cardContainer.frame.size = size
        
        // tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.tableHeaderView?.frame = CGRect(origin: tableView.frame.origin, size: CGSize(width: UIScreen.main.bounds.width, height: 200))
        tableView.tableHeaderView = cardContainer
        tableView.dataSource = self
        tableView.rowHeight = 100
        
    }
    
    func layout() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor)
        ])
        
    }
}



extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! CardsCell
        //cell.textLabel?.text = "\(indexPath.row)"
        cell.configure(text: "TEST")
        return cell
    }
    
    
}



