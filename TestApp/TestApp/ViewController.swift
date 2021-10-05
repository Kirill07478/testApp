//
//  ViewController.swift
//  TestApp
//
//  Created by Kiryusha Orlov on 05.10.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextVCTap(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "ListViewController", bundle: nil)
        guard let listVC = storyboard.instantiateViewController(identifier: "ListViewController") as? ListViewController else { return }
        
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    
}

