//
//  ViewController.swift
//  CoreDataTest2
//
//  Created by Håkon Bogen on 28/10/2020,44.
//  Copyright © 2020 beining & bogen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var urlRequest = URLRequest.init(url: URL.init(string: "https://google.no")!)
        urlRequest.httpMethod = "POST"
        

        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            print(response)
            print(error)
            
            let string = String.init(data: data!, encoding: String.Encoding.utf8)
            print(string)
            
            
            if let student = try? JSONDecoder.init().decode(Movie.self, from: data!) {
                print(student)
            }
            
        }

        task.resume()
        
        
        
    }


}


public struct Actor: Codable, Equatable {
    let name: String
}

