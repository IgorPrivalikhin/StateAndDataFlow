//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var timer = TimeCounter() // экз-р класса ТАймеркаунтер, подписывается под обертку @StateObject - позволяет сохранить состояние объекта в окружении проекта, @StateObject - испо-ся для экземпляров класса
    @EnvironmentObject private var userManager: UserManager // храняться собственные типы данных
    private var storageManager = AppStorageManager()
    
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)") // отображение имени пользователя
                .font(.largeTitle) // полужирный
                .padding(.top, 100) // отступ
            
            Text("\(timer.counter)") // значение
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
            ButtonView(timer: timer)
                .padding(16)
            LogOutButtonView(action: logOut)
            Spacer()
        }
    }
    private func logOut() {
        userManager.isRegistered = false
        userManager.name = ""
        storageManager.userIsRegister = false
        storageManager.userName = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}


struct ButtonView: View { // структура под кнопку
    @ObservedObject var timer: TimeCounter // подписан под структуру Таймер, принимает значение и подписан под @ObservedObject
    
    var body: some View {
        
        Button(action: timer.startTimer) { // вызов старта таймера
            Text(timer.buttonTitle) // обращ к таймеру и метода изменения текста в кнопке
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay( // очертить
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
        
    }
}
