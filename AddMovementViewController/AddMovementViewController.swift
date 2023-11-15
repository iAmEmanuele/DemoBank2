//
//  AddMovementViewController.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 15/11/23.
//

import UIKit

class AddMovementViewController: UIViewController {

    @IBOutlet var navigationItemCustom: UINavigationItem!
    
    @IBOutlet var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }


    @IBAction func deleteAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }

    @IBAction func confirmAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

extension AddMovementViewController {
    func style(){
        // titleLabel
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "Aggiungi\nmovimento"
        navigationItemCustom.titleView = label
        
        // confirmButton
        confirmButton.setTitle("Conferma", for: .normal)
        confirmButton.layer.cornerRadius = 50
    
       
    }
}
