//
//  FeaturedBetCardView.swift
//  SBGWidget
//
//  Created by Ryan Hill on 22/02/2022.
//

import SwiftUI

struct FeaturedBetCardView: View {
    var name: String
    var price: String
    var outcome: String
    var sport: String
    var location: String
    var time: String

    var body: some View {
        VStack {
            EventInformationView(name: name, outcome: outcome, location: location, time: time)

            Spacer()

            AddToBetslipView(price: price)
        }
        .tint(Color(uiColor: .skyBetBlue!))
        .frame(width: 120, height: 120)
        .background(RoundedRectangle(cornerRadius: 12.0, style: .continuous)
            .fill(Color.white))
        .overlay(SportsIconView(sport: sport))
    }
}
