//
//  UIOnboardingContentView.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

struct UIOnboardingContentView: View {
    var withConfiguration: UIOnboardingViewConfiguration
    let onNextAction: (() -> Void)?
    let multiSelect: Bool

    @State var showJumpBackground: Bool

    // MARK: - Properties
    @State private var zoomTitle: Bool = false
    @State private var moveToTopTitle: Bool = false
    @State private var showContent: Bool = false

    @State var selected: [UIOnboardingViewConfiguration.Feature] = []

    var body: some View {
        content()
            .ignoresSafeArea()
            .background(Color(UIColor.systemBackground))
            .onAppear {
                self.showJumpBackground = false

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
                    .offset(y: showJumpBackground ? 1000 : 0)
                    .animation(Animation.linear(duration: 0.5), value: UUID())
                VStack(spacing: 0) {
                    ScrollView(showsIndicators: false) {
                        header(reader: reader)

                        feature(reader: reader)
                            .frame(width: reader.size.height * 1 / 3)
                            .opacity(showContent ? 1 : 0)
                            .padding(.top, reader.size.height * -(1 / 4.8))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                VStack {
                    Spacer()
                    bottomBar(reader: reader)
                        .frame(height: reader.size.height * (1 / 5.6))
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                        .opacity(showContent ? 1.0 : 0)
                }
                .padding([.top, .bottom], 10)

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
                    width: reader.size.height * (1 / 12),
                    height: reader.size.height * (1 / 12)
                )
                .cornerRadius(15)
                .opacity(moveToTopTitle ? 0 : 1)
            Text(withConfiguration.firstTitleLine)
                .font(.system(size: reader.size.height * (1 / 16)))
                .fontWeight(.black)
                .foregroundColor(.black).opacity(zoomTitle ? 1 : 0)
            Text(withConfiguration.secondTitleLine)
                .font(.system(size: reader.size.height * (1 / 16)))
                .fontWeight(.black)
                .foregroundColor(.black).opacity(zoomTitle ? 1 : 0)
        }
        .padding(.top, reader.size.height * (1 / 3.6))
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
                            selected.append(feature)

                            if multiSelect {
                                checkBoxFeature.selected.toggle()
                            } else {
                                checkBoxFeature.selected = true
                            }
                        } label: {
                            UIOnboardingRowCheckBox(
                                permission: checkBoxFeature,
                                reader: reader,
                                iconPadding: true
                            )
                            .padding(.top, reader.size.height * (1 / 68))
                        }
                        .tint(Color(UIColor.label))
                        .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(.bottom, reader.size.height * (1 / 5))
    }
}

// MARK: - Bottom Bar
private extension UIOnboardingContentView {
    @ViewBuilder func bottomBar(reader: GeometryProxy) -> some View {
        UIOnboardingBottomBar(
            bottomBar: self.withConfiguration.bottomBar,
            reader: reader,
            show: onNextAction,
            showContent: self.$showContent
        )
        .padding(.bottom, 20)
    }
}

#Preview {
    LanguageContentView() // WelcomeContentView()
}

// MARK: - Config Settings
// let headerTitleSize: Int
// let headerPaddingTop: Int
// let alignmentFeatures: Int
// let spacingBetwinFeatures: Int
// let showBottomBarBackground: Bool
