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

    // MARK: - Private properties
    private let isPad = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        content()
    }
}

// MARK: - UIOnboardingPermissionRow
private extension UIOnboardingRow {
    @ViewBuilder func content() -> some View {
        HStack(alignment: .top, spacing: isPad ? 26 : 10) {
            Image(uiImage: permission.icon)
                .resizable()
                .frame(width: isPad ? 58 : 45, height: isPad ? 58 : 45)
            HStack {
                VStack(alignment: .leading) {
                    Text(permission.title)
                        .font(.system(size: isPad ? 22 : 18))
                        .fontWeight(.semibold)
                    Text(permission.description)
                        .font(.system(size: isPad ? 20 : 16))
                        .fontWeight(.regular)
                }
            }
        }
        .padding([.leading, .trailing])
        .padding([.top, .bottom], isPad ? 16 : 8)
    }
}
