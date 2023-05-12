//
//  Tab.swift
//  SwiftUIPlay
//
//  Created by lym on 2023/5/11.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "Home"
    case services = "Services"
    case play = "Play"
    case profile = "Profile"

    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .services:
            return "network.badge.shield.half.filled"
        case .play:
            return "play.square.stack"
        case .profile:
            return "person.crop.circle"
        }
    }

    var index: Int {
        Tab.allCases.firstIndex(of: self) ?? 0
    }
}
