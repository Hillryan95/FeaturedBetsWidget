//
//  SBGWidgetTarget.swift
//  SBGWidgetTarget
//
//  Created by Ryan Hill on 21/02/2022.
//

import WidgetKit
import SwiftUI
import Intents
//import SBGWidget

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), name: "", price: "", outcome: "", sport: "", location: "", time: "", configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), name: "Liverpool", price: "1.60", outcome: "Win", sport: "⚽️", location: "Everton", time: "15.00", configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let userDefaults = UserDefaults(suiteName: "group.RyanHill.SBGWidget")
        guard let userDefaults = userDefaults else { return }

        guard let featuredBetArray = userDefaults.object(forKey: "featuredBet") as? [String] else { return }
        let name = featuredBetArray[0]
        let price = featuredBetArray[1]
        let outcome = featuredBetArray[2]
        let sport = featuredBetArray[3]
        let location = featuredBetArray[4]
        let time = featuredBetArray[5]

        let entry = SimpleEntry(date: Date(), name: name , price: price, outcome: outcome, sport: sport, location: location, time: time, configuration: configuration)
        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date

    let name: String
    let price: String
    let outcome: String
    let sport: String
    let location: String
    let time: String
    let configuration: ConfigurationIntent
}

struct SBGWidgetTargetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color(UIColor.skyBetBlue!)

            FeaturedBetCardView(name: entry.name, price: entry.price, outcome: entry.outcome, sport: entry.sport, location: entry.location, time: entry.time)
                .widgetURL(URL(string: "sbgwidget://betslip?price=\(entry.price)")!)
        }
    }
}

@main
struct SBGWidgetTarget: Widget {
    let kind: String = "SBGWidgetTarget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            SBGWidgetTargetEntryView(entry: entry)
        }
        .configurationDisplayName("Sky Bet Widget")
        .description("Use this Widget to See our Featured Bets.")
    }
}
