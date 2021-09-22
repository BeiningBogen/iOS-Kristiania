//
//  CustomViewController.swift
//  Lecture 4
//
//  Created by Benjamin Breiby on 22/09/2021.
//

import UIKit

class CustomViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        button.setTitle("My button", for: .normal)
    }

    @IBAction func didTapButton(_ sender: Any) {
        // Here are three ways to navigate:
        
        // 1. With a segue defined in the storyboard
        performSegue(withIdentifier: "gotosecond", sender: self)
        
        // 2. Programmatically, but with a view controller defined in the storyboard
        present(with: "secondvc")
        
        // 3. Fully programmatically.
        let viewController = SecondViewController.init()
        present(viewController, animated: true, completion: nil)
    }
    
    /// Instantiates a view controller from storyboard and programmatically presents it
    ///
    /// - Parameter identifier: the storyboard identifier for the view controller to be presented
    func present(with identifier: String) {
        guard let destination = storyboard?.instantiateViewController(withIdentifier: identifier)
        else { return }
        
        if let destination = destination as? SecondViewController,
           let text = textField.text {
            destination.someText = text
        }
        present(destination, animated: true) { print("Presented!") }
    }
    
    // Do something before a segue.
    // Will be called if `performSegue` is used.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController,
           let text = textField.text {
            destination.someText = text
        }
    }
}
