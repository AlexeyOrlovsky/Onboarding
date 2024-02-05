//
//  UIOnboardingPermissionRow.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

struct UIOnboardingPermissionRow: View {
    let permission: UIOnboardingFeature
    let reader: GeometryProxy

    @Binding var iconRowSize: CGFloat
    @Binding var iconPadding: Bool

    var body: some View {
        content()
    }
}

extension UIOnboardingPermissionRow {
    @ViewBuilder private func content() -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(uiImage: permission.icon)
                .resizable()
                .frame(width: reader.size.height * (iconRowSize), height: reader.size.height *
                       (iconRowSize))
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
