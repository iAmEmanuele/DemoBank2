//
//  HomePresenter.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 16/11/23.
//


import UIKit

class HomePresenter: AddMovementViewControllerDelegate  {
    
    
    private(set) var userInfo : UserInfo?
    weak var homeViewController : HomeViewController?
    
    init() {
        self.userInfo = ApiManager.userInfo(from: "userInfo")
    }
    
    func openAddMovementViewController(from viewController : UIViewController ){
        let addMovementViewController = AddMovementViewController()
        addMovementViewController.delegate = self
        viewController.present(addMovementViewController, animated: true)
    }
    
    func addMovement(movement: Movement) {
        userInfo?.listaMovimenti.insert(movement, at: 0)
        homeViewController?.updateTableView()
    }
    
}



