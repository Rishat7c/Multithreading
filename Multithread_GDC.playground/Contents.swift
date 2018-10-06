import UIKit
import PlaygroundSupport // Чтобы разрешать дожидаться каждый поток

// Долгожданный GDC
var str = "GDC"

/**
 *  1. DispatchQueue.global
 *  2. DispatchQueue.main
 *  async или sync поток (thread)
 */

class MyViewController: UIViewController {
    
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Demonstration VC"
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initButton()
    }
    
    func initButton() {
        button.frame = CGRect(x:0,y:0,width:200,height:50)
        button.center = view.center
        button.setTitle("Press", for:.normal)
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(button)
    }
    
}

let vc = MyViewController()
let navbar = UINavigationController(rootViewController: vc)

PlaygroundPage.current.liveView = navbar



