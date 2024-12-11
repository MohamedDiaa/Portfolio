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
    var info: [String]

    /// Custom Matched Geometry IDs
    var cardGeometryID: String {
        "card_\(id)"
    }
}

var cards: [Card] = [
    .init(company: "Qvik AB", date: "2022 - 2024", color: .indigo, info: [
        "Maintained and enhanced the Electrolux One App, a global solution for appliance control, using Swift and Kotlin Multiplatform (KMM).",
        "Developed intuitive iOS UI components, integrating with appliances via server connections.",
        "Optimized app performance, reducing load times and improving user experience.",
        "Developed the TrygFonden SOS iOS app to assist patients during cardiac arrests,featuring real-time API integration and critical notifications.",
        "Designed a tailored caching system to ensure high availability and reliability.",
        "Collaborated with cross-functional teams to deliver a seamless user experience."
    ]),
    .init(company: "Svea Ekonomi", date: "2017 - 2022", color: .pink, info: [
        "Architected and developed a Svea Bank app enabling users to pay invoices and apply for loans.",
        "Implemented BankID authentication and seamless CI/CD workflows.",
        "Enhanced app reliability through comprehensive unit testing and performance optimization.",
        "Modernized legacy Objective-C in Arlanda Express App codebase by migrating to Swift, improving maintainability.",
        "Developed offline ticket storage functionality to enhance user convenience.",
        "Built Society Works App an office hotel app enabling resource booking and service subscriptions.",
        "Integrated CI/CD pipelines to streamline app delivery."
    ]),
    .init(company: "KlickData AB", date: "2013 - 2017", color: .cyan, info: [
        "Created educational iOS applications, prioritizing scalable architecture and engaging UI design.",
        "Conducted thorough unit testing to ensure app stability and performance."
    ]),
    .init(company: "Icon Creations", date: "2011 - 2013", color: .orange, info: [
        "Developed and maintained iOS applications written in Objective-C, delivering high-quality, user-centric solutions.",
        "Built and launched Nabd, an Arabic news aggregator app for iPhone and iPad, featuring a paid subscription model.",
        "Created Hyundai Egypt, an app providing car owners with essential services and information.",
        "Designed and implemented an internal-use app for Emaar, a leading real estate company, streamlining operations and improving efficiency.",
        "Participated in Agile workflows, including daily stand-up meetings, to align on development priorities and ensure project milestones were met.",
        "Managed app certifications and signing, ensuring smooth deployment and compliance with Apple's standards."
    ])
]
