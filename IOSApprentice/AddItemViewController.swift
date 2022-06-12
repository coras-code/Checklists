//
//  AddItemViewController.swift
//  IOSApprentice
//
//  Created by Novoda on 14/05/2019.
//  Copyright © 2019 cjm. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller: AddItemViewController)
    
    func addITemViewController(controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //makes the text field active
        textField.becomeFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK:- Actions
    @IBAction func cancel() {
//        navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(controller: self)
    }
    
    @IBAction func done() {
        //navigationController?.popViewController(animated: true)
        
        let item = ChecklistItem()
        item.text = textField.text!
        
        delegate?.addITemViewController(controller: self, didFinishAdding: item)
//
        print("Contents of the text field: \(textField.text!)")
            
        
    }
    
    // MARK:- Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return nil
//table view sends the delegate a willSelectRowAt message-select this row. the delegate answers: not allowed to
    }
    
    // MARK:- Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        doneBarButton.isEnabled = !newText.isEmpty
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}
