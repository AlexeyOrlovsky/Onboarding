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

    var body: some View {
        content()
    }
}

extension UIOnboardingPermissionRow {
    @ViewBuilder private func content() -> some View {

        VStack(alignment: .leading, spacing: 30) {
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 10) {
                    Image(uiImage: (
                        UIImage(named: "\(permission.icon)") ?? UIImage(systemName: "\(permission.icon)")) ?? .init()) // 🏳️
                    .resizable()
                    .frame(width: reader.size.height * (1 / 24), height: reader.size.height *
                           (1 / 24))
                    VStack(alignment: .leading) {
                        Text(permission.title)
                            .font(.system(size: reader.size.height * (1 / 46)))
                            .fontWeight(.semibold)
                        Text(permission.description)
                            .font(.system(size: reader.size.height * (1 / 46)))
                            .fontWeight(.regular)
                    }
                }
            }
        }
    }
}
