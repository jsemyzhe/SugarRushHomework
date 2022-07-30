//
//  FirstScreenViewController.swift
//  SugarRush
//
//  Created by Julia Semyzhenko on 3/8/22.
//

import UIKit

class FirstScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        backItem.tintColor = UIColor(red: 200, green: 200, blue: 200, alpha: 1)
        navigationItem.backBarButtonItem = backItem
    }
}
