//
//  Card.swift
//  Portifolio
//
//  Created by Mohamed Alwakil on 2024-12-11.
//



import SwiftUI

struct Card: Identifiable {
    var id: String = UUID().uuidString
    var company: String
    var date: String
    var color: Color
    
    /// Custom Matched Geometry IDs
    var cardGeometryID: String {
        "card_\(id)"
    }
}

var cards: [Card] = [
    .init(company: "Qvik AB", date: "2022 - 2024", color: .blue),
    .init(company: "Svea Ekonomi", date: "2017 - 2022", color: .indigo),
    .init(company: "KlickData AB", date: "2013 - 2017", color: .pink),
    .init(company: "Icon Creations", date: "2011 - 2013", color: .black),
]
