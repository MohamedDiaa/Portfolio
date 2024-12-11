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
                ForEach(1...20, id: \.self) { _ in
                    HStack(spacing: 15) {
                        Circle()
                            .fill(.gray.tertiary)
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(.gray.tertiary)
                                .frame(height: 8)
                            
                            RoundedRectangle(cornerRadius: 2)
                                .fill(.gray.tertiary)
                                .frame(height: 8)
                                .padding(.trailing, 100)
                            
                            RoundedRectangle(cornerRadius: 2)
                                .fill(.gray.tertiary)
                                .frame(width: 50, height: 8)
                        }
                    }
                    .padding(15)
                    .background(.background.shadow(.drop(color: .black.opacity(0.06), radius: 5, x: 5, y: 5)), in: .rect(cornerRadius: 10))
                }
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
}
