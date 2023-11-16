//
//  AddMovementViewController.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 15/11/23.
//

import UIKit

protocol AddMovementViewControllerDelegate : AnyObject {
    func addMovement(movement : Movement)
}

class AddMovementViewController: UIViewController {
    weak var delegate : AddMovementViewControllerDelegate?
    @IBOutlet var navigationItemCustom: UINavigationItem!
    
    @IBOutlet var confirmButton: UIButton!
    
    @IBOutlet var nametextField: UITextField!
    @IBOutlet var amountTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
    
    
    @IBAction func deleteAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func confirmAction(_ sender: UIButton) {
        if let name = nametextField.text , let amountString = amountTextField.text, let amount = Double(amountString) {
            let movement = Movement(esercente: name, descrizione: "", importo: amount)
            delegate?.addMovement(movement: movement)
            self.dismiss(animated: true)
        }
       
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
