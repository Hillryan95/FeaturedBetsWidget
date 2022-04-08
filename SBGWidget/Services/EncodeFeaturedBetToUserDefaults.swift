//
//  EncodeFeaturedBetToUserDefaults.swift
//  SBGWidget
//
//  Created by Ryan Hill on 03/03/2022.
//

import SwiftUI
import WidgetKit

struct EncodeFeaturedBetToUserDefaults {

    @AppStorage("rememberItem", store: UserDefaults(suiteName: "group.RyanHill.SBGWidget")) var featuredBetData: Data = Data()
    let featuredBet: FeaturedBet

    func storeBet() {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(featuredBet) else {
            print("Could not encode data")
            return
        }
        featuredBetData = data
        WidgetCenter.shared.reloadAllTimelines()
        print(String(decoding: featuredBetData, as: UTF8.self))
    }
}
