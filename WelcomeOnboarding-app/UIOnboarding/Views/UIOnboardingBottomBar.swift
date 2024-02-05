//
//  UIOnboardingButton.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

struct UIOnboardingBottomBar: View {
    var bottomBar: UIOnboardingBottomBarConfiguration
    let reader: GeometryProxy

    @Binding var showContent: Bool
    @Binding var show: (() -> Void)?

    var body: some View {
        content()
    }
}

extension UIOnboardingBottomBar {
    @ViewBuilder private func content() -> some View {
        VStack {
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
                            print("Continue Button tapped")
                        } label: {
                            Text(bottomBar.buttonText)
                                .font(.system(size: reader.size.height * (1 / 42)))
                                .foregroundColor(showContent ? Color(UIColor.systemBackground) : .clear)
                                .fontWeight(.bold)
                        }
                        .frame(width: reader.size.height * (1 / 3.2), height: reader.size.height *
                               (1 / 16))
                        .background(showContent ? Color(UIColor.label) : .clear)
                        .cornerRadius(reader.size.height *
                                      (1 / 52))
                    }
                }
            }
        }
    }
}
