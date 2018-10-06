import UIKit

/* Какие могут быть проблемы у потоков? Пример: Голодание (starvation) */

// Один поток
let recursiveLock = NSRecursiveLock()

class RecursiveMutexText {
    private var mutex = pthread_mutex_t()
    private var atribute = pthread_mutexattr_t()
    
    init() {
        pthread_mutexattr_init(&atribute)
        pthread_mutexattr_settype(&atribute, PTHREAD_MUTEX_RECURSIVE) // Настройка рекурсива
        pthread_mutex_init(&mutex, &atribute)
    }
    
    func firstTask() {
        pthread_mutex_lock(&mutex) // Срабатывает первый метод лока
        secondTask()
        defer {
            pthread_mutex_unlock(&mutex) // Пока не сработает вторая функ, анлок не сработает
        }
    }
    
    func secondTask() {
        pthread_mutex_lock(&mutex)
        print("Finish")
        defer {
            pthread_mutex_unlock(&mutex)
        }
    }
    
}

// Создадим экземпляр
let recursive = RecursiveMutexText()
// Обращаемся к функц
recursive.firstTask()
