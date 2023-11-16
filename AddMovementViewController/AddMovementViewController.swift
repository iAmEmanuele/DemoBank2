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
        if #available(iOS 15.0, *) {
            confirmButton.configuration?.background.cornerRadius = 30
            confirmButton.configuration?.contentInsets = NSDirectionalEdgeInsets(
                top: 10,
                leading: 40,
                bottom: 10,
                trailing: 40
            )
        } else {
            confirmButton.setCornerRadius(30)
            confirmButton.contentEdgeInsets = UIEdgeInsets(
                top: 10,
                left: 40,
                bottom: 10,
                right: 40
            )
        }
        confirmButton.isEnabled = false
        
        // amountTextField
        amountTextField.delegate = self
        
        // nameTextField
        nametextField.delegate = self
        
        
    }
    
    func disableConfirmButton(textField: UITextField) {
        guard textField.text != nil  else {
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
