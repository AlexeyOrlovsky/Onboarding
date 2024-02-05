//
//  UIOnboardingContentView.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

struct UIOnboardingContentView: View {
    var withConfiguration: UIOnboardingViewConfiguration

    // MARK: Settings
    @State var headerTitleSize: CGFloat
    @State var swipeBackground: Bool
    @State var positionFeatures: CGFloat
    @State var spasingBetwinFeatures: CGFloat
    @State var headerPosition: CGFloat
    @State var iconRowSize: CGFloat
    @State var showBottomBarBackground: Bool
    @State var showCheckmarkInRow: Bool
    @State var iconPadding: Bool
    // @State var showNextScreen:
    // @State var spacingRows: CGFloat

    @State private var zoomTitle = false
    @State private var moveToTopTitle = false
    @State private var showContent = false
    @State var showOnboardingPermissions = false

    var body: some View {
        content()
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity) // 🏳️
            .background(swipeBackground ? Color(UIColor.systemBackground) : Color(UIColor.systemBackground))
            .onAppear {
                self.swipeBackground = true

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
extension UIOnboardingContentView {
    @ViewBuilder private func content() -> some View {
        GeometryReader { reader in
            ZStack {
                Color(UIColor.systemGray6)
                    .offset(y: swipeBackground ? 0 : 1000)
                    .animation(Animation.linear(duration: 0.5))

                VStack(spacing: 0) {
                    ScrollView(showsIndicators: false) {
                        header(reader: reader)

                        feature(reader: reader)
                            .frame(width: reader.size.height * (1 / 3))
                            .opacity(showContent ? 1 : 0)
                            .scaleEffect(zoomTitle ? 1 : 0.5)
                            .padding(.top, reader.size.height * -(positionFeatures))
                            .animation(.easeInOut(duration: 0.3))
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
                        .animation(.easeInOut(duration: 0.3))
                }
                .padding([.top, .bottom], 10)

            }
            .ignoresSafeArea()
        }
    }
}

// MARK: - Header
extension UIOnboardingContentView {
    @ViewBuilder private func header(reader: GeometryProxy) -> some View {
        VStack(alignment: .leading) {

            Image(uiImage: (
                UIImage(
                    named: "\(withConfiguration.appIcon)"
                ) ?? UIImage(
                    systemName: "\(withConfiguration.appIcon)")
            ) ?? .init()) // 🏳️
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
        .padding(.top, reader.size.height * (headerPosition))
        .scaleEffect(zoomTitle ? 1 : 0.5)
        .offset(y: moveToTopTitle ? reader.size.height * -(1 / 3.5) : 0)
        .animation(.easeInOut(duration: 1.0))
    }
}

// MARK: - Feature
extension UIOnboardingContentView {
    @ViewBuilder private func feature(reader: GeometryProxy) -> some View {
        VStack(alignment: .leading) {
            ForEach(withConfiguration.features) { feature in
                switch feature {
                    case .plain(let onboardingFeatures):
                        ForEach(onboardingFeatures, id: \.id) { permission in
                            UIOnboardingPermissionRow(permission: permission,
                                                      reader: reader,
                                                      iconRowSize: $iconRowSize,
                                                      showCheckmark: $showCheckmarkInRow,
                                                      iconPadding: $iconPadding
                            )
                        }
                    case .checkBox(let checkBoxFeatures):
                        ForEach(checkBoxFeatures) { checkBoxPermission in
                            Button {
                                print("Hello")
                            } label: {
                                UIOnboardingPermissionRowCheckBox(permission: checkBoxPermission,
                                                                  reader: reader,
                                                                  iconRowSize: $iconRowSize,
                                                                  showCheckmark: $showCheckmarkInRow,
                                                                  iconPadding: $iconPadding
                                )
                            }
                            .tint(Color(UIColor.label))
                            .buttonStyle(.plain)
                        }
                }
            }
        }
    }
}

// MARK: - Bottom Bar
extension UIOnboardingContentView {
    @ViewBuilder private func bottomBar(reader: GeometryProxy) -> some View {
        UIOnboardingBottomBar(bottomBar: self.withConfiguration.bottomBar,
                              reader: reader, showContent: self.$showContent,
                              showOnboardingPermissions: $showOnboardingPermissions
        )
        .padding(.bottom, 20)
    }
}

#Preview {
    LanguageContentView() // WelcomeContentView()
}
