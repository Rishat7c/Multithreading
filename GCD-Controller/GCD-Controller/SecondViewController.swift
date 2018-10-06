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
        
//        let queue = DispatchQueue.global(qos: .utility)
//        queue.async {
//            DispatchQueue.concurrentPerform(iterations: 20000) {
//                print("\($0) times")
//                print(Thread.current)
//            }
//        }
        
        MyInActiveView()
        
    }
    
    func MyInActiveView() {
        let inactiveView = DispatchQueue(label: "Rishat system", attributes: [.concurrent, .initiallyInactive]) // Это пиздец какая редкость. Подобных примеров нет!
        
        inactiveView.async {
            print("Готово!")
        }
        
        print("Не стартануло...")
        inactiveView.activate()
//        print("Стартанул!")
//        inactiveView.suspend() // отправляем в сон
//        print("Сон! Zzz...")
//        inactiveView.resume() // разбудили
        
    }
    
}
