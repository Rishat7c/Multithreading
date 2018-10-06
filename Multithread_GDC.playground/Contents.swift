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
        button.addTarget(self, action: #selector(pressAction), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initButton()
    }
    
    @objc func pressAction() {
//        print("pressed")
        let vc = MySecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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

class MySecondViewController: UIViewController {
    
    var image = UIImageView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Demonstration VC 2"
        view.backgroundColor = UIColor.white
        
//        // Пока не придет наш имейдж с адреса, ничего не произойдет
//        let imageURL: URL = URL(string: "https://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!
//
//        // Data - ниже это суммка для байтов
//        if let data = try? Data(contentsOf: imageURL) {
//            self.image.image = UIImage(data: data)
//        }
        
        loadPhoto()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initImage()
    }
    
    func initImage() {
        image.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        image.center = view.center
        view.addSubview(image)
    }
    
    func loadPhoto() {
        
        // Пока не придет наш имейдж с адреса, ничего не произойдет
        let imageURL: URL = URL(string: "https://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!
        
        // Создаем глобальную очеред, после чего мы к ней будем обращаться
        // где .utility - это ВЫСОКИЙ приоритет
        let queue = DispatchQueue.global(qos: .utility)
        
        // Если мы работаем с АСИНХРОННЫМ методом, то и в дальнейшем вызываем АСИНХРОННОСТЬ
        // Иначе вызывется блокировка потока deadlock
        queue.async {
            if let data = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: data)
                }
            }
        }
        
    }
    
}

let vc = MyViewController()
let navbar = UINavigationController(rootViewController: vc)

PlaygroundPage.current.liveView = navbar



