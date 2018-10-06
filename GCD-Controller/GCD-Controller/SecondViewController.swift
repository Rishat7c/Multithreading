//
//  SecondViewController.swift
//  GCD-Controller
//
//  Created by Ришат Гайсин on 06/10/2018.
//  Copyright © 2018 Ришат Гайсин. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for i in 0...200000 {
//            print(i)
//        }
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            DispatchQueue.concurrentPerform(iterations: 20000) {
                print("\($0) times")
                print(Thread.current)
            }
        }
        
    }
    
    
    
}
