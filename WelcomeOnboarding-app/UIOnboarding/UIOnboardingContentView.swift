//
//  UIOnboardingContentView.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

struct UIOnboardingContentView: View {
    var withConfiguration: UIOnboardingViewConfiguration

    @State private var zoomTitle = false
    @State private var moveToTopTitle = false
    @State private var showContent = false

    var body: some View {
        content()
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGray6))
    }
}

// MARK: - Content
extension UIOnboardingContentView {
    @ViewBuilder private func content() -> some View {
        GeometryReader { reader in
            ZStack {
                VStack(spacing: 0) {
                    ScrollView(showsIndicators: false) {
                        header(reader: reader)
                        feature(reader: reader)
                            .frame(width: reader.size.height * (1 / 3))
                            .opacity(showContent ? 1 : 0)
                            .scaleEffect(zoomTitle ? 1 : 0.5)
                            .padding(.top, reader.size.height * -(1 / 3.6))
                            .animation(.easeInOut(duration: 0.3))
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                    showContent = true
                                }
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }

                VStack {
                    Spacer()
                    bottomBar(reader: reader)
                        .frame(height: reader.size.height * (1 / 5.6))
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial.opacity(showContent ? 1.0 : 0))
                        .animation(.easeInOut(duration: 0.3))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                showContent = true
                            }
                        }
                }
                .padding([.top, .bottom], 10)
            }
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
                .font(.system(size: reader.size.height * (1 / 16)))
                .fontWeight(.black)
                .foregroundColor(.black).opacity(zoomTitle ? 1 : 0)
            Text(withConfiguration.secondTitleLine)
                .font(.system(size: reader.size.height * (1 / 16)))
                .fontWeight(.black)
                .foregroundColor(.black).opacity(zoomTitle ? 1 : 0)
        }
        .padding(.top, reader.size.height * (1 / 3))
        .scaleEffect(zoomTitle ? 1 : 0.5)
        .offset(y: moveToTopTitle ? reader.size.height * -(1 / 3.5) : 0)
        .animation(.easeInOut(duration: 1.0))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                zoomTitle = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                moveToTopTitle = true
            }
        }
    }
}

// MARK: - Feature
extension UIOnboardingContentView {
    @ViewBuilder private func feature(reader: GeometryProxy) -> some View {
        VStack(alignment: .leading) {
            ForEach(withConfiguration.features, id: \.id) { permission in //
                UIOnboardingPermissionRow(permission: permission, reader: reader)
            }
        }
    }
}

// MARK: - Bottom Bar
extension UIOnboardingContentView {
    @ViewBuilder private func bottomBar(reader: GeometryProxy) -> some View {
        UIOnboardingBottomBar(bottomBar: self.withConfiguration.bottomBar, reader: reader, showContent: self.$showContent)
            .padding(.bottom, 20)
    }
}

#Preview {
    WelcomeContentView()
}
