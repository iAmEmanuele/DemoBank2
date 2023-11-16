//
//  ViewController.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 08/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let cardContainer = ProfileView(frame: .zero)
    private let cardsReuseID = "customCell"
    private let movementReuseID = "movementsCell"
    private let tableView = UITableView()
    private var homePresenter : HomePresenter =  HomePresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homePresenter.homeViewController = self
        style()
        layout()
        if let userInfo = homePresenter.userInfo{
            cardContainer.configure(mainIfo: userInfo.infoPrincipali)
            
        }else{
            cardContainer.configure(mainIfo: MainInfo(nome: "unknown", cognome: "unknown", saldo: 0))
        }
        tableView.register(CardsCell.self, forCellReuseIdentifier: cardsReuseID)
        tableView.register(UINib(nibName: "MovementCellTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: movementReuseID)
        
    }
    
    func updateTableView(){
        tableView.reloadData()
    }
    
    @objc func goToAddMovement(){
        homePresenter.openAddMovementViewController(from: self)
    }
}

extension HomeViewController {
    func style() {
        // navigationItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(goToAddMovement))
        self.navigationController?.navigationBar.barTintColor = .brown
        self.navigationItem.title = "Home"
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
        
    }
    
    func layout() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor)
        ])
        
    }
}



extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movements = homePresenter.userInfo?.listaMovimenti else {
            return 1
        }
        
        if movements.count <= 15 {
            return movements.count + 1
        } else{
            return 15 + 1
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: cardsReuseID, for: indexPath) as! CardsCell
            if let cards = homePresenter.userInfo?.carte{
                cell.configure(temp: cards)
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: movementReuseID, for: indexPath) as! MovementCellTableViewCell
            if let movements = homePresenter.userInfo?.listaMovimenti{
                cell.configure(movement: movements[indexPath.row-1])
            }
            return cell
            
        }
        
    }
}
