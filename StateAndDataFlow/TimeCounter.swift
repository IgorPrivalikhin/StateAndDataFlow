//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import Foundation
import Combine // импорт фреймворка от apple

class TimeCounter: ObservableObject { // ObservableObject - протокол под который подписываем для дальнейшего изменения интерсфеса
    var objectWillChange = PassthroughSubject<TimeCounter, Never>()// objectWillChange - св-во протокола для которого нужно подписаться под Combine, св-во нужно для отслеживания изменений в интерфейсе
    // PassthroughSubject - инициализация которые инициализируем  TimeCounter - объект за которым следим и Never - точка выхода из кода (заглушка без обработки ошибок)
    
    
    var counter = 3 // число начало отсчета
    var timer: Timer? // экз-р класса таймер
    var buttonTitle = "Start" // начальное имя кнопки
    
    func startTimer() { // будем вызывать из СV через экз-р TimeCounter
        if counter > 0 { // если знач больше 0 - инициализируем таймер
            timer = Timer.scheduledTimer( // параметры для таймера
                timeInterval: 1, // время в секунду изменений
                target: self, // метод хдесь же поэтому селф
                selector: #selector(updateCounter), // метод через селектор
                userInfo: nil, // доп инфо - нет
                repeats: true // повторятся пока не дойдет до нужного значения
            )
        }
        
        buttonDidTapped() // вызов метода регулирования кнопки
    }
    
    @objc private func updateCounter() { // метод под изменения
        if counter > 0 {
            counter -= 1
        } else {
            killTimer() // прекратить таймер с помощью метода
            buttonTitle = "Reset" // текст в кнопке меняем на Reset когда таймер = 0
        }
        
        objectWillChange.send(self) //отправка измененного объекта (всего класса)
    }
    
    private func killTimer() {
        timer?.invalidate() // метод для остановки таймера
        timer = nil // обнуление
    }
    
    private func buttonDidTapped() { //метод для изменения названия кнопки
        if buttonTitle == "Reset" {
            counter = 3 // назначаем снова 3
            buttonTitle = "Start" // изменение на Старт
        } else { // иначе
            buttonTitle = "Wait..." // если не дошли до 0, то Wait...
        }
        
        objectWillChange.send(self) // уведомляем подписчика сам класс CV
    }
}
