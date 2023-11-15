//
//  AddMovementViewController.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 15/11/23.
//

import UIKit

class AddMovementViewController: UIViewController {

    @IBOutlet var navigationItemCustom: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemCustom.title = "Aggiungi Movimenti"
        
    }


    @IBAction func deleteAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }

}
