//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import SwiftUI

struct RegisterView: View { // экран логина
  //  @State private var name = "" // св-во под состояние
   // @State private var charactersCount = 0 // счетчик букв
   // @EnvironmentObject private var userManager: UserManager // доступ к экз-ру через обертку @EnvironmentObject - позволяет следить за сотоянием объекта
    @StateObject private var appStorageManager = AppStorageManager()
    @EnvironmentObject private var userManager: UserManager
    //@Binding var text: String
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter your name...", text: $appStorageManager.userName)
                    .multilineTextAlignment(.center)
                Text(appStorageManager.userName.count.formatted())
                    .foregroundColor(appStorageManager.userName.count > 2 ? Color.green : Color.red)
                    .padding(.trailing)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(appStorageManager.userName.count > 2 ? false : true)
        }.onAppear() {
            userManager.isRegistered = appStorageManager.userIsRegister
            userManager.name = appStorageManager.userName
        }
    }
        
    private func registerUser() {
        if !appStorageManager.userName.isEmpty {
            userManager.name = appStorageManager.userName
            userManager.isRegistered = true
            appStorageManager.userIsRegister = true

        }
    }
    }
    
    struct RegisterView_Previews:
        PreviewProvider {
        static var previews: some View {
            RegisterView()
        }
    }
