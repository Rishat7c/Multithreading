import UIKit

class QueueTesting1 {
    private let serialQueue = DispatchQueue(label: "SerialTest") // Последовательная очередь
    private let concurentQueue = DispatchQueue(label: "ConcurrentTest", attributes: .concurrent)
    // Остальная магия под капотом свифта
}

class QueueTesting2 {
    private let globalQueue = DispatchQueue.global()
    private let MainQueue = DispatchQueue.main
    // Остальная магия под капотом свифта
}
