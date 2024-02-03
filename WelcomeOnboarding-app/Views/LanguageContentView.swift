//
//  LanguageContentView.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 03.02.2024.
//

import SwiftUI

struct LanguageContentView: View {
    private var withConfiguration: UIOnboardingViewConfiguration {
        UIOnboardingViewConfiguration.Onboarding.languagesPage()
    }

    var body: some View {
        UIOnboardingContentView(withConfiguration: withConfiguration)
    }
}

#Preview {
    LanguageContentView()
}
