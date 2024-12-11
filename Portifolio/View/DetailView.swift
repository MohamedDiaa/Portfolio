//
//  DetailView.swift
//  Portifolio
//
//  Created by Mohamed Alwakil on 2024-12-11.
//
import SwiftUI

struct DetailView: View {
    var selectedCard: Card
    var body: some View {

        ScrollView(.vertical) {
            LazyVStack(spacing: 12) {
                ForEach(selectedCard.info, id: \.self) { text in
                    HStack(spacing: 15) {
                        Circle()
                            .fill(.black)
                            .frame(width: 10, height: 10)
                        Text(text)
                            .font(.title3)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(15)
                    .background(.background.shadow(.drop(color: .black.opacity(0.06), radius: 5, x: 5, y: 5)), in: .rect(cornerRadius: 10))
                }
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
}
