//
//  ViewController.swift
//  Task 9
//
//  Created by Benjamin Breiby on 12/08/2020.
//  Copyright © 2020 Westerdals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let title = "Wololo!"
        let message = "🔥🔥🔥🔥🔥"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        self.present(alert, animated: true, completion: nil)
    }
}

