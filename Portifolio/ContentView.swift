//
//  ContentView.swift
//  Portifolio
//
//  Created by Mohamed Alwakil on 2024-12-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = $0.safeAreaInsets

            Home(size: size, safeArea: safeArea)
                .ignoresSafeArea(.container, edges: .top)
        }
        .background(.gray.opacity(0.1))
    }
}

#Preview {
    ContentView()
}
