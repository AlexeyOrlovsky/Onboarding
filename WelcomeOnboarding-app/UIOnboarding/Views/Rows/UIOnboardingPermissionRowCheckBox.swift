//
//  UIOnboardingPermissionRowCheckBox.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 05.02.2024.
//

import SwiftUI

struct UIOnboardingPermissionRowCheckBox: View {
    var permission: UIOnboardingFeatureCheckBox
    let reader: GeometryProxy

    @Binding var iconRowSize: CGFloat
    @Binding var showCheckmark: Bool
    @Binding var iconPadding: Bool

    var body: some View {
        content()
    }
}

extension UIOnboardingPermissionRowCheckBox {
    @ViewBuilder private func content() -> some View {

        VStack(alignment: .leading, spacing: 30) {
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 10) {
                    Image(uiImage: (
                        UIImage(named: "\(permission.icon)") ?? UIImage(systemName: "\(permission.icon)")) ?? .init()) // 🏳️
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

                        Spacer()

                        Image(systemName: showCheckmark ? "checkmark" : .init())
                            .opacity(permission.selected ? 1.0 : 0.0)
                    }
                }
            }
        }
    }
}
