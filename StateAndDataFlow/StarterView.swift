//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import SwiftUI

struct StarterView: View { // для определения стартового экрана
    
    @EnvironmentObject private var userManager: UserManager // берем из окружения через  @EnvironmentObject
    
    var body: some View {
        Group { // отображение вью если пользовательль введен, Group - контейнер для ветвления
            if userManager.isRegistered {
                ContentView()
            } else {
                RegisterView() // иначе вью регистрации
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager()) // инициализация через модификатор .environmentObject, передаем UserManager() чтобы не возникло ошибок
    }
}
