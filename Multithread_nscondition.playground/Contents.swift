import UIKit

// Документация https://developer.apple.com/documentation/foundation/nscondition
var str = "NSCondition()"

// Создаем пустой массив
var array = [String]()

// Поток и подключение
var available = false
var condition = pthread_cond_t()
var mutex = pthread_mutex_t()

// Создаем класс и наследуемся от Потока (thread'a)
class PrinterMutex: Thread {
    
    override init() {
        pthread_cond_init(&condition, nil)
        pthread_mutex_init(&mutex, nil)
    }
    
    override func main() {
        printerMethod()
    }
    
    // Создаем приватный метод, который будет называтся printer...
    private func printerMethod() {
        pthread_mutex_lock(&mutex)
        
        print("printerMethod - entered")
        
        while (!available) {
            // Заставляем его поспать
            pthread_cond_wait(&condition, &mutex)
        }
        available = false
        defer {
            // Снимаем блокировку
            pthread_mutex_unlock(&mutex)
        }
        
        print("printerMethod - exit")
    }
    
}

// С начала записываем , а потом вызываем принтер
// p/s/ это другой поток
class WriterMutex: Thread {
    
    override init() {
        pthread_cond_init(&condition, nil)
        pthread_mutex_init(&mutex, nil)
    }
    
    override func main() {
        writerMethod()
    }
    
    // Создаем приватный метод, который будет называтся printer...
    private func writerMethod() {
        pthread_mutex_lock(&mutex)
        
        print("writer - entered")
        
        pthread_cond_signal(&condition) // Посылаем сигнал, что мы готовы
        
        available = true
        defer {
            // Снимаем блокировку
            pthread_mutex_unlock(&mutex)
        }
        
        print("writer - exit")
    }
    
}

// Обращаемся
let contionMutexWrite = WriterMutex()
let contionMutexPrint = PrinterMutex()
// Стартуем с начала ПРИНТЕР а потом запись
contionMutexPrint.start()
contionMutexWrite.start()
