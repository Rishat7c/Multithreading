import UIKit

/**
 *  Quality of service (QoS) Приоритеты потока
 */

var example = "Quality of service" + ("Качество обслуживания")

var pthread = pthread_t(bitPattern: 0)
// инициализируем
var atribute = pthread_attr_t()

pthread_attr_init(&atribute)
// Добавляем поток
pthread_attr_set_qos_class_np(&atribute, QOS_CLASS_USER_INITIATED, 0)

// Где pointer у нас замыкает
pthread_create(&pthread, &atribute, { (pointer) -> UnsafeMutableRawPointer? in
    print("test")
    // Можем преопределить приоритет
    pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0)
    return nil
}, nil)

// После того как расмотрели капот, переходим к блоку
let nsThread = Thread {
    print("test")
    print(qos_class_self())
}

// Забыл что хотел написать, поэтому представлю что все таки свифт топ ленгуэдж
// Дополнение 2. Например, когда юзер что-то таппает, чтобы не заставлять его ждать устанавливаем приоритет повыше/
nsThread.qualityOfService = .userInteractive
nsThread.start()

// Печатаем главный поток
print(qos_class_main())

// п/с/ не путать очереди с потоками (т/к/ очередь - это структура данных)
