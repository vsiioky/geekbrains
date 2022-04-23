//
//  NewViewController.swift
//  VKapp
//
//  Created by Владислав Калабанов on 10.04.2022.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideScreen))
        view.addGestureRecognizer(tapGR)

        // Do any additional setup after loading the view.
    }
    @objc func hideScreen (){
        view.endEditing(true)
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willHideNotification(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @objc func willShowKeyboard (_ notification: Notification){
       guard let info = notification.userInfo as NSDictionary?,
             let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
        
        let keyboardHeight = keyboardSize.cgRectValue.size.height
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
    }
    
    @objc func willHideNotification (_ notification: NotificationCenter) {
        scrollView.contentInset = .zero
    }
    
    @IBAction func tabButton(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              login == "+7",
              password == "" else {
            show(message: "Error enter")
            return
        }
        performSegue(withIdentifier: "Login", sender: nil)
    }
}

extension NewViewController{
    func show(message: String) {
        let alertVC = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
        
    }
    
}
