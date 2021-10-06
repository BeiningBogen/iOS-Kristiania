//
//  ViewController.swift
//  Lecture5
//
//  Created by Benjamin Breiby on 06/10/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var contacts = ["Benji", "Håkon", "Andreas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Root"
        let addBarButton = UIBarButtonItem.init(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(pushSomeRandomControllerToStack))
        navigationItem.rightBarButtonItem = addBarButton
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc
    private func pushSomeRandomControllerToStack() {
        let viewController = UIViewController.init()
        viewController.navigationItem.title = "Second"
        viewController.view.backgroundColor = .green
        navigationController?.pushViewController(viewController, animated: true)
        //        navigationController?.popViewController(animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ClassyTableViewCell
        cell.titleTextLabel.text = contacts[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Did select:", contacts[indexPath.row])
    }
}
