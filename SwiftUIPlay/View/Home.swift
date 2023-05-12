//
//  Home.swift
//  SwiftUIPlay
//
//  Created by lym on 2023/5/11.
//

import SwiftUI

struct Home: View {
    @State private var activeTab: Tab = .home
    
    var body: some View {
        VStack {
            TabView(selection: $activeTab) {
                Text(Tab.home.rawValue)
                    .tag(Tab.home)

                Text(Tab.services.rawValue)
                    .tag(Tab.services)

                Text(Tab.play.rawValue)
                    .tag(Tab.play)

                Text(Tab.profile.rawValue)
                    .tag(Tab.profile)
            }

            TabBar(activeTab: $activeTab)
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
