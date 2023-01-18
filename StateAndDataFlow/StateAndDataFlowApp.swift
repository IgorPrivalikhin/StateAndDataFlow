//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Vasichko Anna on 16.01.2023.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var userManager = UserManager() // экз-р класса UserManager( для того чтобы св-во было доступно в рамках всего проекта
    
    var body: some Scene {
        WindowGroup {
            StarterView() // для отображения страртового вью
                .environmentObject(userManager) // инициализация св-ва через .environmentObject
        }
    }
}
