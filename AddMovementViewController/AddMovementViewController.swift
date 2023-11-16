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
        guard let amountString = amountTextField.text, let amount = Double(amountString) else {
            return showAlertDialog(title: "DemoBank2", message: "L'importo inserito non è valido ")
        }
        if let name = nametextField.text {
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
        confirmButton.isEnabled = false
        
        // amountTextField
        amountTextField.delegate = self
        
        // nameTextField
        nametextField.delegate = self
        
        
    }
    
    func disableConfirmButton(textField: UITextField) {
        guard let currentText = textField.text  else {
            return confirmButton.isEnabled = false
        }
        if !amountTextField.text!.isEmpty && !nametextField.text!.isEmpty {
            return confirmButton.isEnabled = true
        }else{
            return confirmButton.isEnabled = false
        }
        
    }
}

extension AddMovementViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        disableConfirmButton(textField: textField)
        return textField.resignFirstResponder()
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        disableConfirmButton(textField: textField)
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        disableConfirmButton(textField: textField)
    }
}
