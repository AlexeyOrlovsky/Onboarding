//
//  UIOnboardingButton.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

struct UIOnboardingBottomBar: View {
    // MARK: - Properties
    var bottomBar: UIOnboardingBottomBarConfiguration
    let reader: GeometryProxy
    let show: (() -> Void)?

    // MARK: - Properties
    @Binding var showContent: Bool
    private let isPad = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        content()
    }
}

// MARK: - UIOnboardingBottomBar
private extension UIOnboardingBottomBar {
    @ViewBuilder func content() -> some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Image(systemName: bottomBar.icon)
                        .resizable()
                        .frame(width: reader.size.height * (1 / 60), height: reader.size.height *
                               (1 / 60))
                        .foregroundColor(showContent ? Color(UIColor.systemGray2) : .clear)
                    Text(bottomBar.subtitle)
                        .font(.system(size: reader.size.height * (1 / 60)))
                        .foregroundColor(showContent ? Color(UIColor.systemGray2) : .clear)
                }
                VStack(alignment: .center) {
                    Button {
                        show?()
                        debugPrint("Continue Button tapped")
                    } label: {
                        Text(bottomBar.buttonText)
                            .font(.system(size: isPad ? 24 : 20))
                            .foregroundColor(showContent ? Color(UIColor.systemBackground) : .clear)
                            .fontWeight(.bold)
                    }
                    .frame(width: isPad ? 342 : 252, height: isPad ? 64 : 54)
                    .background(showContent ? Color(UIColor.label) : .clear)
                    .cornerRadius(reader.size.height *
                                  (1 / 52))
                }
            }
        }
    }
}
