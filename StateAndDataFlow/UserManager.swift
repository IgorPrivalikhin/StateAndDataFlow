//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import Foundation

class UserManager: ObservableObject { // фиксация данных
   @Published var isRegistered = false // св-во под фиксация регистрации пользователя подписанное под  обуртку @Published, при регистрации пользователя меняется на true
   var name = "" // фиксация 
}
