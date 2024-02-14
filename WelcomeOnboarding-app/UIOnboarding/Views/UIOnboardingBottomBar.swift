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
    var showContent: Bool

    // MARK: - Private properties
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
                VStack(spacing: 18) {
                    Image(systemName: bottomBar.icon)
                        .resizable()
                        .frame(width: isPad ? 18 : 16, height: isPad ? 18 : 16)
                        .foregroundColor(showContent ? Color(UIColor.systemGray2) : .clear)
                    Text(bottomBar.subtitle)
                        .font(
                            .system(
                                size: isPad ? 14 : reader.size.height * (1 / 62)))
                        .foregroundColor(showContent ? Color(UIColor.systemGray) : .clear)
                }
                .padding(.bottom, 10)

                VStack(alignment: .center) {
                    Button {
                        show?()
                        debugPrint("Continue Button tapped")
                    } label: {
                        Text(bottomBar.buttonText)
                            .font(.system(size: isPad ? 20 : 18))
                            .foregroundColor(showContent ? Color(UIColor.systemBackground) : .clear)
                            .fontWeight(.bold)
                    }
                    .frame(width: isPad ? 340 : 282, height: isPad ? 54 : 54)
                    .background(showContent ? Color(UIColor.label) : .clear)
                    .cornerRadius(isPad ? reader.size.height * (1 / 70) : reader.size.height * (1 / 44))
                }
            }
        }
        .padding(.bottom, isPad ? 10 : 20)
    }
}
