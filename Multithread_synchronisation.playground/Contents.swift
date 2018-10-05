import UIKit

var str = "Synchronisation & Mutes"
/* Защита данных и синхронизация */

/**
 *  Представим что у нас имеется массив [array]
 *  Этот массив мы создали в главном потоке и позже создаем асинхронный поток для записи/считывания в нем данных
 *  - append
 *  - read
 *  Может возникнуть коллизия данных, типа данные искажаются
 *  Для этого и используется СИНХРОНИЗАЦИЯ (с помощью Сшных mutex'ов) - Привет, sa
 */

class SavePotok {
    private var mutex = pthread_mutex_t()
    
    // Вызываем инициализацию нашего класса
    init() {
        pthread_mutex_init(&mutex,nil)
    }
    
    // Создадим метод какой-нибудь
    // Будет передавать объект через замыкание
    func somePotok(competion: () -> ()) {
        // Где будет происходить разблокировка
        // p.s. это замок, передали ему ссылку на наш mutex
        pthread_mutex_lock(&mutex)
        // Ниже типа пойдут какие-то данные
        competion() // а тут мы уже вызвали метод внутри себя, когда данные попадут сюда
        defer { // Это типа так должно быть - подушка
            // p.s. а ниже, мы снимаем блокирование потока
            pthread_mutex_unlock(&mutex)
            // Эта вся шляпа нужна для корреткной работы
        }
    }
    
}

// Теперь попробуем поиграться с передачей массива
var array = [String]()
let savePotok = SavePotok()

savePotok.somePotok {
    print("test")
    array.append("1 potok") // Добавляем запись в массив
    // Эта констуркция защищенная
}
