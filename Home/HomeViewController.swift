//
//  ViewController.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 08/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let cardContainer = ProfileView(frame: .zero)
    let cardsReuseID = "customCell"
    let movementReuseID = "movementsCell"
    let tableView = UITableView()
    
    var userInfo : UserInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInfo = ApiManager.userInfo
        style()
        layout()
        if let mainInfo = userInfo?.infoPrincipali{
            cardContainer.configure(mainIfo: mainInfo)
        }else{
            cardContainer.configure(mainIfo: MainInfo(nome: "unknown", cognome: "unknown", saldo: 0))
        }
        tableView.register(CardsCell.self, forCellReuseIdentifier: cardsReuseID)
        tableView.register(UINib(nibName: "MovementCellTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: movementReuseID)
        
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
        (userInfo?.listaMovimenti.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: cardsReuseID, for: indexPath) as! CardsCell
            if let cards = userInfo?.carte{
                cell.configure(temp: cards)
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: movementReuseID, for: indexPath) as! MovementCellTableViewCell
            if let movements = userInfo?.listaMovimenti{
                cell.configure(movement: movements[indexPath.row-1])
            }
            return cell
            
        }
       
    }
    
    
    
}

//
//extension HomeViewController : UITableViewDelegate {
//    table
//}



