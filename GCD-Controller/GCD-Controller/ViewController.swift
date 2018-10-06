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
        
        afterBlock(seconds: 2, queue: .main) {
            print("Hello")
            print(Thread.current)
        }
    }
    
    func afterBlock(seconds: Int, queue: DispatchQueue = DispatchQueue.global() ,complition: @escaping() -> ()) {
        // Тут очередь будет по дефолту по умолчанию
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            complition()
        }
    }


}

