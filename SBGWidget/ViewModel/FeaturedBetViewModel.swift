//
//  FeaturedBetViewModel.swift
//  SBGWidget
//
//  Created by Ryan Hill on 21/02/2022.
//

import Foundation

struct FeaturedBetViewModel {
    private let model: FeaturedBet

    init(model: FeaturedBet) {
        self.model = model
    }

//    var name: String
//    var outcome: String
//    var time: String
//    var location: String
//    var price: String
//    var sport: String

    var name: String {
        return model.name.capitalized
    }

    var outcome: String {
        return model.outcome.capitalized
    }

    var time: String {
        return model.time
    }

    var location: String {
        return model.location.capitalized
    }

    var price: String {
        return "@\(model.price)"
    }

    var sport: String {
        let sport = model.sport
        if sport == "horse" {
            return "🐎"
        } else if sport == "football" {
            return "⚽️"
        } else if sport == "cricket" {
            return "🏏"
        } else if sport == "rugby" {
            return "🏉"
        } else {
            return "❓"
        }
    }
}
