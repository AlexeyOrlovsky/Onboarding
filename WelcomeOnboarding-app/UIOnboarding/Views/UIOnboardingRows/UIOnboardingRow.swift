//
//  UIOnboardingPermissionRow.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

struct UIOnboardingRow: View {
    // MARK: - Properties
    let permission: UIOnboardingFeature
    let reader: GeometryProxy
    var iconPadding: Bool
    private let isPad = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        content()
    }
}

// MARK: - UIOnboardingPermissionRow
private extension UIOnboardingRow {
    @ViewBuilder func content() -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(uiImage: permission.icon) // Image(permission.icon) 🚩
                .resizable()
                .frame(width: isPad ? 50 : 45, height: isPad ? 50 : 45)
            HStack {
                VStack(alignment: .leading) {
                    Text(permission.title)
                        .font(.system(size: isPad ? 24 : 18))
                        .fontWeight(.semibold)
                    Text(permission.description)
                        .font(.system(size: isPad ? 22 : 16))
                        .fontWeight(.regular)
                }
                .padding(.top, iconPadding ? reader.size.height * (1 / 60) : 0)
            }
        }
    }
}
