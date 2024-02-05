//
//  AppCoordinatorViewModel.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 05.02.2024.
//

import SwiftUI
import FlowStacks

// MARK: - AppVMCoordinatorViewModel
class AppCoordinatorViewModel: ObservableObject {
    // MARK: - Screen
    enum Screen {
        case languageView
        case welcomeView
    }

    // MARK: - Public Properties
    @Published var routes: Routes<Screen> = [.root(.languageView, embedInNavigationView: true)]
}
