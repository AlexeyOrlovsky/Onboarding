//
//  UIOnboardingPermissionRowCheckBox.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 05.02.2024.
//

import SwiftUI

struct UIOnboardingRowCheckBox: View {
    // MARK: - Properties
    var permission: UIOnboardingFeatureCheckBox
    let reader: GeometryProxy
    var iconPadding: Bool
    private let isPad = UIDevice.current.userInterfaceIdiom == .pad
    var isSelected: Bool

//    init(isSelected: Bool) {
//        self.isSelected = permission.selected ?? false ? permission.selected ?? false : false
//    }

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
                .frame(width: isPad ? 50 : 45, height: isPad ? 50 : 45)
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(permission.title)
                        .font(.system(size: isPad ? 24 : 18))
                        .fontWeight(.semibold)
                }
                .padding(.top, iconPadding ? reader.size.height * (1 / 100) : 0)
                Spacer()
                isSelected ? Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: reader.size.height * (1 / 52), height: reader.size.height * (1 / 52)) : nil
            }
        }
    }
}
