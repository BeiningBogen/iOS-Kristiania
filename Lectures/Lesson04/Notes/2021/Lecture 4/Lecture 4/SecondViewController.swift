//
//  SecondViewController.swift
//  Lecture 4
//
//  Created by Benjamin Breiby on 22/09/2021.
//

import UIKit

class SecondViewController: UIViewController {
    public var someText: String = ""
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = someText
    }
}
