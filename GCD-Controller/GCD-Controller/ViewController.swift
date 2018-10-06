//
//  ViewController.swift
//  GCD-Controller
//
//  Created by Ришат Гайсин on 06/10/2018.
//  Copyright © 2018 Ришат Гайсин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        afterBlock(seconds: 4, queue: .global()) {
//            print("Hello")
//            print(Thread.current)
//        }
        
//        afterBlock(seconds: 3) {
//            print("Hello again")
//            self.showAlert()
//            print(Thread.current)
//        }
        
        
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: nil, message: "Hello :)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func afterBlock(seconds: Int, queue: DispatchQueue = DispatchQueue.global() ,complition: @escaping() -> ()) {
        // Тут очередь будет по дефолту по умолчанию
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            complition()
        }
    }


}

