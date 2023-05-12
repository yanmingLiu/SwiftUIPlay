//
//  ContentView.swift
//  SwiftUIPlay
//
//  Created by lym on 2023/5/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
