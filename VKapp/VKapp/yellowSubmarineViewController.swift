//
//  yellowSubmarineViewController.swift
//  VKapp
//
//  Created by Владислав Калабанов on 12.04.2022.
//

import UIKit

class yellowSubmarineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.backgroundColor = .red
    }
}
