//
//  AddItemViewController.swift
//  IOSApprentice
//
//  Created by Novoda on 14/05/2019.
//  Copyright © 2019 cjm. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK:- Actions
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
    
}
