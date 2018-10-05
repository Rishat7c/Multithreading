import UIKit

/**
 *  Пример реализации:
 *  - Thread-ов (Работа с потоками)
 *  - Operation (Работа с потоками)
 *  - GCD (Верхнеуровневый диспетчер, альтернатива потокам. Он в первую очередь позволяет сосредоточиться на задачах)
 */

/**
 *  Параллельная очередь:
 *  ------------------------- (Поток 1)
 *  ------------------------- (Поток 2)
 */

/**
 *  Последовательная очередь (друг за другом):
 *  - - -(Поток 1)
 *  -- - (Поток 2)
 * Пока выполняется первый поток, второй не может стартовать
 */


/**
 *  Асинхронная очередь
 *  Main thread (Главный поток. UI вычисления): ----------
 *  Пока не загрузится все процессы, и нам например, необходимо достать какое-то изображение
 *  Second thread:                                  -
 */

/**
 *  Подробнее в документации https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/Introduction/Introduction.html
 */

/**
 * 1. UNIX приметив. Низкоуровневый поток (Процедура POSIX - 'посикс')
 */

var thread = pthread_t(bitPattern: 0) // Создаем поток
// Теперь необходимо создать С-шный атрибут
var atribute = pthread_attr_t()

// Необходимо про-инициализировать этот атрибут
pthread_attr_init(&atribute) // Сылаемся на него
pthread_create(&thread, &atribute, { (pointer) -> UnsafeMutableRawPointer? in
    print("test")
    return nil
}, nil)

/**
 *  2. Thread. Поток
 *  Здесь у нас будет небольшая отсылочка в С (Привет, sa-mp)
 */

// Вызывем блок - замыкание
var nsthread = Thread {
    print("test")
}
// В первый пункт является капотом этой конструкции
// Запускаем поток
nsthread.start()
// Установка приоритета
// Чем выше приоритет, тем быстрее он выполняется
Thread.setThreadPriority(2)
nsthread.cancel()