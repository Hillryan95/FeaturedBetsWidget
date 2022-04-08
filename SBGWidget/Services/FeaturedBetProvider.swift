//
//  FeaturedBetProvider.swift
//  SBGWidget
//
//  Created by Ryan Hill on 21/02/2022.
//

import Foundation

class BetProvider {

    var bets: [FeaturedBet] = []

    init() {
    }

    func loadGames() {
        guard let jsonFileURL = Bundle.main.url(forResource: "featuredBets", withExtension: "json") else {
            print("unable to find json")
            return
        }
        print("found json")

        guard let jsonData = try? Data(contentsOf: jsonFileURL) else {
            print("unable to create json from \(jsonFileURL)")
            return
        }
        print("created json")

        guard let loadedRecipes = try? JSONDecoder().decode([FeaturedBet].self, from: jsonData) else {
            print("unable to decode json")
            return
        }

        bets = loadedRecipes
    }
}
