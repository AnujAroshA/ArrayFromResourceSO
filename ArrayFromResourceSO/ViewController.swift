//
//  ViewController.swift
//  ArrayFromResourceSO
//
//  Created by Arosha Piyadigama on 9/2/19.
//  Copyright © 2019 AnujAroshA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result : Array = linesFromResource(fileName: "DataSet")
        print(result.shuffled().prefix(Int.random(in: 0 ..< result.count)))
    }

    func linesFromResource(fileName: String) -> [String] {
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: nil) else {
            fatalError("Resource file for \(fileName) not found.")
        }
        do {
            let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return content.components(separatedBy: "\n")
        } catch let error {
            fatalError("Could not load strings from \(path): \(error).")
        }
    }
}

