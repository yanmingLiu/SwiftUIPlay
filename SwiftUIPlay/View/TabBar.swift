//
//  TabBar.swift
//  SwiftUIPlay
//
//  Created by lym on 2023/5/12.
//

import SwiftUI

struct TabBar: View {
    var tint: Color = .gray
    var inactiveTint: Color = .blue
    @Binding var activeTab: Tab

    @Namespace private var animation
    @State private var tabShapPoint: CGPoint = .zero

    init(activeTab: Binding<Tab>) {
        _activeTab = activeTab
        UITabBar.appearance().isHidden = true
        UITabBar.appearance().backgroundColor = .red
    }
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabBarItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    animation: animation,
                    activeTab: $activeTab,
                    position: $tabShapPoint
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(
            TabShap(midpoint: tabShapPoint.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        )
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}

struct TabBarItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint

    @State private var tabShapPosition: CGPoint = .zero

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(tab == activeTab ? .white : tint)
                .frame(width: tab == activeTab ? 50 : 35, height: tab == activeTab ? 50 : 35)
                .background {
                    if (tab == activeTab) {
                        Circle()
                            .fill(inactiveTint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }

            Text(tab.rawValue)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(tab == activeTab ? inactiveTint : tint)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completioon: { rect in
            tabShapPosition.x = rect.midX

            if (tab == activeTab) {
                position.x = rect.midX
            }
        })
        .onTapGesture {
            activeTab = tab

            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                position.x = tabShapPosition.x
            }
        }
    }
}
