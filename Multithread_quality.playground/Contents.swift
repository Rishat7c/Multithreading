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
