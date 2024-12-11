//
//  HomeView.swift
//  Portifolio
//
//  Created by Mohamed Alwakil on 2024-12-11.
//

import SwiftUI

struct Home: View {
    var size: CGSize
    var safeArea: EdgeInsets
    /// View Properties
    @State private var showDetailView: Bool = false
    @State private var selectedCard: Card?
    @Namespace private var animation
    var body: some View {
        /// ScrollView with Cards UI
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                Text("My Portfolio")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .trailing) {
                        Button {

                        } label: {
                            Image(.pic)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .clipShape(.circle)
                        }
                    }
                    .blur(radius: showDetailView ? 5 : 0)
                    .opacity(showDetailView ? 0 : 1)

                /// Cards View
                /// Also modify the main offset to show the selected card
                let mainOffset = CGFloat(cards.firstIndex(where: { $0.id == selectedCard?.id }) ?? 0) * -size.width

                LazyVStack(spacing: 10) {
                    ForEach(cards) { card in
                        /// Let's convert this scrollview to horizontal without changing any of it's properties and by just using the offset modifier
                        let cardOffset = CGFloat(cards.firstIndex(where: { $0.id == card.id }) ?? 0) * size.width

                        CardView(card)
                            .frame(width: showDetailView ? size.width : nil)
                            .visualEffect { [showDetailView] content, proxy in
                                content
                                    .offset(x: showDetailView ? cardOffset : 0, y: showDetailView ? -proxy.frame(in: .scrollView).minY : 0)
                            }
                    }
                }
                .padding(.top, 25)
                .offset(x: showDetailView ? mainOffset : 0)
            }
            .safeAreaPadding(15)
            .safeAreaPadding(.top, safeArea.top)
        }
        .scrollDisabled(showDetailView)
        .scrollIndicators(.hidden)
        .overlay {
            if let selectedCard, showDetailView {
                DetailView(selectedCard: selectedCard)
                    .padding(.top, expandedCardHeight)
                    .transition(.move(edge: .bottom))
            }
        }
    }

    /// Card View
    @ViewBuilder
    func CardView(_ card: Card) -> some View {
        ZStack {
            Rectangle()
                .fill(card.color.gradient)
            VStack(alignment: .leading, spacing: 15) {
                if !showDetailView {
                    CompanyImageView(card.cardGeometryID, height: 20)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(card.company)
                        .font(.title2.bold())
                        .foregroundStyle(.white)

                    Text(card.date)
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: showDetailView ? .center : .leading)
                .overlay {
                    ZStack {
                        if showDetailView {
                            CompanyImageView(card.cardGeometryID, height: 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                /// Let's move to close to the date
                                .offset(y: 45)
                        }

                        if let selectedCard, selectedCard.id == card.id, showDetailView {
                            Image(systemName: "chevron.left")
                                .font(.title3.bold())
                                .foregroundStyle(.white)
                                .padding(5)
                                .contentShape(.rect)
                                .onTapGesture {
                                    /// Closing the view
                                    withAnimation(.smooth(duration: 0.5, extraBounce: 0)) {
                                        self.selectedCard = nil
                                        showDetailView = false
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .transition(.asymmetric(insertion: .opacity, removal: .identity))
                        }
                    }
                }
                .padding(.top, showDetailView ? safeArea.top - 10 : 0)

                HStack {
                    Text("iOS developer")
                        .font(.caption)

                    Spacer()

                    Text("")
                        .font(showDetailView ? .caption : .callout)
                }
                .foregroundStyle(.white.secondary)
            }
            .padding(showDetailView ? 15 : 25)
        }
        .frame(height: showDetailView ? expandedCardHeight : nil)
        .frame(height: 200, alignment: .top)
        .clipShape(.rect(cornerRadius: showDetailView ? 0 : 25))
        .onTapGesture {
            guard !showDetailView else { return }
            withAnimation(.smooth(duration: 0.5, extraBounce: 0)) {
                selectedCard = card
                showDetailView = true
            }
        }
    }

    @ViewBuilder
    func CompanyImageView(_ id: String, height: CGFloat) -> some View {
        Image(.appleLogo)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .matchedGeometryEffect(id: id, in: animation)
            .frame(height: height)
    }

    var expandedCardHeight: CGFloat {
        safeArea.top + 130
    }
}

#Preview {
    ContentView()
}
