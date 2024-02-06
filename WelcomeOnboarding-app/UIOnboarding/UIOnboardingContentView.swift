//
//  UIOnboardingContentView.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

struct UIOnboardingContentView: View {
    var withConfiguration: UIOnboardingViewConfiguration

    // MARK: - Config Settings
    @State var headerTitleSize: CGFloat
    @State var headerAlignment: CGFloat
    @State var showJumpBackground: Bool
    @State var alignmentFeatures: CGFloat
    @State var spacingBetwinFeatures: CGFloat
    @State var iconRowSize: CGFloat
    @State var showBottomBarBackground: Bool
    @State var iconRowSpacing: Bool
    @State var navigator: (() -> Void)?

    // MARK: - Properties
    @State private var zoomTitle: Bool = false
    @State private var moveToTopTitle: Bool = false
    @State private var showContent: Bool = false
    @State private var showOnboardingPermissions: Bool = false

    var body: some View {
        content()
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(showJumpBackground ? Color(UIColor.systemBackground) : Color(UIColor.systemBackground))
            .onAppear {
                self.showJumpBackground = false

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    zoomTitle = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    moveToTopTitle = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    showContent = true
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
                            .frame(width: reader.size.height * (1 / 3))
                            .opacity(showContent ? 1 : 0)
                            .scaleEffect(zoomTitle ? 1 : 0.5)
                            .padding(.top, reader.size.height * -(alignmentFeatures))
                            .animation(Animation.easeInOut(duration: 0.3), value: UUID())
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }

                VStack {
                    Spacer()
                    bottomBar(reader: reader)
                        .frame(height: reader.size.height * (1 / 5.6))
                        .frame(maxWidth: .infinity)
                        .background(showBottomBarBackground ? .ultraThinMaterial : .regular)
                        .opacity(showContent ? 1.0 : 0)
                        .animation(Animation.easeInOut(duration: 0.3), value: UUID())
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
            .frame(width: reader.size.height * (1 / 12), height: reader.size.height *
                   (1 / 12))
            .cornerRadius(15)
            .opacity(moveToTopTitle ? 0 : 1)
            Text(withConfiguration.firstTitleLine)
                .font(.system(size: reader.size.height * (headerTitleSize)))
                .fontWeight(.black)
                .foregroundColor(.black).opacity(zoomTitle ? 1 : 0)
            Text(withConfiguration.secondTitleLine)
                .font(.system(size: reader.size.height * (headerTitleSize)))
                .fontWeight(.black)
                .foregroundColor(.black).opacity(zoomTitle ? 1 : 0)
        }
        .padding(.top, reader.size.height * (headerAlignment))
        .scaleEffect(zoomTitle ? 1 : 0.5)
        .offset(y: moveToTopTitle ? reader.size.height * -(1 / 3.5) : 0)
        .animation(Animation.easeInOut(duration: 1.0), value: UUID())
    }
}

// MARK: - Feature
private extension UIOnboardingContentView {
    @ViewBuilder func feature(reader: GeometryProxy) -> some View {
        VStack(alignment: .leading) {
            ForEach(withConfiguration.features) { feature in
                switch feature {
                    case .plain(let onboardingFeatures):
                        ForEach(onboardingFeatures) { permission in
                            UIOnboardingRow(permission: permission,
                                                      reader: reader,
                                                      iconRowSize: $iconRowSize,
                                                      iconPadding: $iconRowSpacing
                            )
                        }
                    case.checkBox(let checkBoxFeatures):
                        ForEach(checkBoxFeatures.indices) { index in
                            Button {
                                checkBoxFeatures.indices.forEach { checkBoxFeatures[$0].selected = false }
                                checkBoxFeatures[index].selected = true
                            } label: {
                                UIOnboardingRowCheckBox(permission: checkBoxFeatures[index],
                                                                  reader: reader,
                                                                  iconRowSize: $iconRowSize,
                                                                  iconPadding: $iconRowSpacing
                                )
                                .padding(.top, reader.size.height * (spacingBetwinFeatures))
                            }
                            .tint(Color(UIColor.label))
                            .buttonStyle(PlainButtonStyle())
                        }
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
            showContent: self.$showContent,
            show: $navigator
        )
        .padding(.bottom, 20)
    }
}

#Preview {
    LanguageContentView() // WelcomeContentView()
}
