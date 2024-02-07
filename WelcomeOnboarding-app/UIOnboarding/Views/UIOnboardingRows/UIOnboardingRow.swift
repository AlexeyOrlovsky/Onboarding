//
//  UIOnboardingPermissionRow.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

struct UIOnboardingRow: View {
    let permission: UIOnboardingFeature
    let reader: GeometryProxy

    // MARK: - Properties
    @Binding var iconRowSize: CGFloat
    var iconPadding: Bool

    var body: some View {
        content()
    }
}

// MARK: - UIOnboardingPermissionRow
private extension UIOnboardingRow {
    @ViewBuilder func content() -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(uiImage: permission.icon)
                .resizable()
                .frame(width: reader.size.height * (iconRowSize), height: reader.size.height * (iconRowSize))
            HStack {
                VStack(alignment: .leading) {
                    Text(permission.title)
                        .font(.system(size: reader.size.height * (1 / 46)))
                        .fontWeight(.semibold)
                    Text(permission.description)
                        .font(.system(size: reader.size.height * (1 / 46)))
                        .fontWeight(.regular)
                }
                .padding(.top, iconPadding ? reader.size.height * (1 / 60) : 0)
            }
        }
    }
}
