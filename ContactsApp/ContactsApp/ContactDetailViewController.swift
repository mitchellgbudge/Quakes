//
//  ContactDetailViewController.swift
//  ContactsApp
//
//  Created by William Chen on 7/28/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    var contact: String?
    
    @IBOutlet weak var contactLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.contactLabel.text = contact
        // Do any additional setup after loading the view.
    }
    



}
