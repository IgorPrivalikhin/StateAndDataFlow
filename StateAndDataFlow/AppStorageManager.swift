//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Анастасия Булдакова on 17.01.2023.
//

import SwiftUI //!!

class AppStorageManager: ObservableObject {
    @AppStorage("userIsRegister") var userIsRegister = false
    @AppStorage("userName") var userName = ""
}
