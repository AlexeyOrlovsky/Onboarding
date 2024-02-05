//
//  UIOnboardingCheckInBox.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 04.02.2024.
//

import SwiftUI

public class UIOnboardingFeatureCheckBox: Identifiable, ObservableObject {
    public var id = UUID()
    var icon: UIImage
    var iconTint: Color
    var title: String
    var description: String
    @Published var selected: Bool

    public init(
        icon: UIImage,
        iconTint: Color = Color(UIColor.label),
        title: String,
        description: String,
        selected: Bool
    ) {
        self.icon = icon
        self.iconTint = iconTint
        self.title = title
        self.description = description
        self.selected = selected
    }
}