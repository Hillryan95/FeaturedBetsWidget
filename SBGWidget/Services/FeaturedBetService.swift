//
//  FeaturedBetService.swift
//  SBGWidget
//
//  Created by Ryan Hill on 21/02/2022.
//

import Foundation

class FeaturedBetService {
    private let betProvider: BetProvider

    var allFeaturedBets: [FeaturedBet] {
        print(betProvider.bets)
        return betProvider.bets
    }

    init(betProvider: BetProvider = BetProvider()) {
        self.betProvider = betProvider
        betProvider.loadGames()
    }

    var randomBet: FeaturedBet {
        return allFeaturedBets.randomElement()!
    }
}
