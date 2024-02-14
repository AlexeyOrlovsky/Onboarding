//
//  UIOnboardingPermissionRowCheckBox.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 05.02.2024.
//

import SwiftUI

struct UIOnboardingRowCheckBox: View {
    // MARK: - Properties
    let permission: UIOnboardingFeatureCheckBox
    let reader: GeometryProxy
    let iconPadding: Bool
    let isSelected: Bool

    // MARK: - Private properties
    private let isPad = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        content()
    }
}

// MARK: - UIOnboardingPermissionRowCheckBox
private extension UIOnboardingRowCheckBox {
    @ViewBuilder func content() -> some View {
        HStack(spacing: 16) {
            Image(uiImage: permission.icon)
                .resizable()
                .frame(width: isPad ? 60 : 43, height: isPad ? 60 : 43)
            HStack {
                Text(permission.title)
                    .font(.system(size: isPad ? 24 : 18))
                    .fontWeight(.semibold)
                Spacer()
                isSelected ? Image(systemName: "checkmark")
                    .resizable()
                    .frame(
                        width: isPad ? 20 : reader.size.height * 1 / 52,
                        height: isPad ? 20 : reader.size.height * 1 / 52
                    ) : nil
            }
        }
    }
}
