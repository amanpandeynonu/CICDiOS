//
//  ViewController.swift
//  TestCaseDemo
//
//  Created by CodeCat15 on 12/24/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var navigationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClick() {
        let secondVC = SecondVC()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }

}

