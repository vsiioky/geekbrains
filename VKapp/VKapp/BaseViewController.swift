//
//  ViewController.swift
//  VKapp
//
//  Created by Владислав Калабанов on 09.04.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet var redView: UIView!
    let purpleView = UIView()
    let blueView = UIView()
    
    @IBOutlet var redView2: UIView!

    override func viewDidLoad() {
        super.viewDidLoad() //Все настройки для настройки
        view.addSubview(blueView)
        view.addSubview(purpleView)
        purpleView.backgroundColor = .purple
        blueView.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() { //Вспомогательный метод для размещения элементов на экране
        purpleView.frame = CGRect(x: 0, y: 0, width: 126, height: 32)
        blueView.frame = CGRect(x: 302, y: 0, width: 126, height: 32)
        print(redView.frame)
    }
    
    override func viewWillAppear(_ animated: Bool) { //вызывается каждый раз когда открывается экран
        super.viewWillAppear(animated)
        print(#function)
    }
    override func viewDidAppear(_ animated: Bool) { //Вызывается когда view уже открылся! обычно используется для запуска анимации
        super.viewDidAppear(animated)
        print(#function)
    }
    override func viewWillDisappear(_ animated: Bool) { //В данном методе делаются очистки
        super.viewWillDisappear(animated)
        print(#function)
    }
    override func viewDidDisappear(_ animated: Bool) { //В данном методе делаются очистки
        super.viewDidDisappear(animated)
        print(#function)
    }
//viewDidUnload - метод выгрузки пример когда ушли с одного экрана зашли в другой выгрузить view
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print(#function) //viewWillTransition используется при перемещении элементов на экране, при перевороте экрана

    }
    @IBAction func tapButton(_ sender: Any) {
        print(#function)
    }
    
}
