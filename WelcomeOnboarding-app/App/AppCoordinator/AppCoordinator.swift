//
//  AppCoordinator.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 05.02.2024.
//

import SwiftUI
import FlowStacks

typealias AppFlowNavigator = FlowNavigator<AppCoordinatorViewModel.Screen>

// MARK: - AppCoordinator
struct AppCoordinator: View {
    @StateObject var viewModel = AppCoordinatorViewModel()

     private var languageView = LanguageContentView()
     private var welcomeView = WelcomeContentView()

    var body: some View {
        Router($viewModel.routes) { screen, _ in
            switch screen {
                case.languageView:
                    languageView
                case.welcomeView:
                    welcomeView
            }
        }
    }
}
