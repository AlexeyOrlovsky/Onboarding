//
//  UIOnboardingPermissionRowCheckBox.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 05.02.2024.
//

import SwiftUI

struct UIOnboardingRowCheckBox: View {
    @ObservedObject var permission: UIOnboardingFeatureCheckBox
    let reader: GeometryProxy

    // MARK: - Properties
    @Binding var iconRowSize: CGFloat
    @Binding var iconPadding: Bool

    var body: some View {
        content()
    }
}

// MARK: - UIOnboardingPermissionRowCheckBox
private extension UIOnboardingRowCheckBox {
    @ViewBuilder func content() -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(uiImage: permission.icon)
                .resizable()
                .frame(width: reader.size.height * (iconRowSize), height: reader.size.height * (iconRowSize))
            HStack(alignment: .center) {
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

                permission.selected ? Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: reader.size.height * (1 / 52), height: reader.size.height * (1 / 52)) : nil
            }
        }
    }
}
