//
//  UIOnboardingContentView.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

struct UIOnboardingContentView: View {
    // MARK: - Properties
    let withConfiguration: UIOnboardingViewConfiguration
    let headerTitleSize: Double
    let headerTitleSizeIsPad: Double
    let headerTitlePadding: Double
    let featurePadding: Double
    let onboardingRowWidth: Double
    let showBottomBarBackground: Bool
    let onNextAction: (() -> Void)?
    let multiSelect: Bool
    let onSelectItems: (([UIOnboardingViewConfiguration.Feature]) -> Void)?
    let showWithPresentAnimation: Bool

    // MARK: - Private Properties
    @State private var yBGOffset: CGFloat = 1000
    @State private var zoomTitle: Bool = false
    @State private var moveToTopTitle: Bool = false
    @State private var showContent: Bool = false
    @State private var selected: [UIOnboardingViewConfiguration.Feature] = []
    private let isPad = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        content()
            .ignoresSafeArea()
            .background(Color(UIColor.systemBackground))
            .onAppear {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.yBGOffset = self.showWithPresentAnimation ? 0 : 1000
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        zoomTitle = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        moveToTopTitle = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        showContent = true
                    }
                }
            }
    }
}

// MARK: - Content
private extension UIOnboardingContentView {
    @ViewBuilder func content() -> some View {
        GeometryReader { reader in
            ZStack {
                Color(UIColor.systemGray6)
                    .offset(y: showWithPresentAnimation ? self.yBGOffset : 0)

                VStack(alignment: .leading, spacing: 0) {
                    ScrollView(showsIndicators: false) {
                            header(reader: reader)

                            feature(reader: reader)
                                .frame(width: isPad ? 520 : onboardingRowWidth)
                                .opacity(showContent ? 1 : 0)
                                .padding(.top, reader.size.height * -(1 / featurePadding))
                                .padding(.bottom, reader.size.height * (isPad ? 1 / 4 : 1 / 3.4))
                    }
                }
                VStack {
                    Spacer()
                    bottomBar(reader: reader)
                        .frame(height: reader.size.height * (isPad ? 1 / 4 : 1 / 3.4))
                        .frame(maxWidth: .infinity)
                        .background(showBottomBarBackground ? .ultraThinMaterial : .ultraThickMaterial)
                        .opacity(showContent ? 1.0 : 0)
                }
                .padding(.top, 0)
            }
            .ignoresSafeArea()
        }
    }
}

// MARK: - Header
private extension UIOnboardingContentView {
    @ViewBuilder func header(reader: GeometryProxy) -> some View {
        VStack(alignment: .leading) {
            Image(uiImage: withConfiguration.appIcon)
                .resizable()
                .opacity(zoomTitle ? 1 : 0)
                .frame(
                    width: isPad ? reader.size.height * (1 / 12) : 70,
                    height: isPad ? reader.size.height * (1 / 12) : 70
                )
                .cornerRadius(15)
                .opacity(moveToTopTitle ? 0 : 1)
            Text(withConfiguration.firstTitleLine)
                .font(.system(size: CGFloat(isPad ? headerTitleSizeIsPad : headerTitleSize)))
                .fontWeight(isPad ? .black : .heavy)
                .foregroundColor(.black).opacity(zoomTitle ? 1 : 0)
            Text(withConfiguration.secondTitleLine)
                .font(.system(size: CGFloat(isPad ? headerTitleSizeIsPad : headerTitleSize)))
                .fontWeight(isPad ? .black : .heavy)
                .foregroundColor(.black).opacity(zoomTitle ? 1 : 0)
        }
        .padding(.top, isPad
                 ? reader.size.height * (1 / 3.8)
                 : reader.size.height * CGFloat(1 / headerTitlePadding)
        )
        .scaleEffect(zoomTitle ? 1 : 0.5)
        .offset(y: moveToTopTitle ? reader.size.height * -(1 / 4.4) : 0)
    }
}

// MARK: - Feature
private extension UIOnboardingContentView {
    @ViewBuilder func feature(reader: GeometryProxy) -> some View {
        VStack(alignment: .leading) {
            Spacer()
            ForEach(withConfiguration.features) { feature in
                switch feature {
                    case .plain(let plainFeature):
                        UIOnboardingRow(
                            permission: plainFeature,
                            reader: reader,
                            iconPadding: false
                        )
                    case .checkBox(let checkBoxFeature):
                        Button {
                            if multiSelect {
                                if let index = selected.firstIndex(where: { feature in
                                    if case .checkBox(let featureCheckBox) = feature {
                                        return featureCheckBox.id == checkBoxFeature.id
                                    }
                                    return false
                                }) {
                                    selected.remove(at: index)
                                } else {
                                    selected.append(.checkBox(checkBoxFeature))
                                }
                            } else {
                                selected.removeAll()
                                selected.append(.checkBox(checkBoxFeature))
                            }
                            self.onSelectItems?(self.selected)
                        } label: {
                            let isSelected = selected.contains { feature in
                                if case .checkBox(let featureCheckBox) = feature {
                                    return featureCheckBox.id == checkBoxFeature.id
                                }
                                return false
                            }

                            UIOnboardingRowCheckBox(
                                permission: checkBoxFeature,
                                reader: reader,
                                iconPadding: true,
                                isSelected: isSelected
                            )
                        }
                        .tint(Color(UIColor.label))
                        .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

// MARK: - Bottom Bar
private extension UIOnboardingContentView {
    @ViewBuilder func bottomBar(reader: GeometryProxy) -> some View {
        UIOnboardingBottomBar(
            bottomBar: self.withConfiguration.bottomBar,
            reader: reader,
            show: onNextAction,
            showContent: self.showContent
        )
        .padding(.bottom, reader.size.height * (1 / 25))
    }
}
