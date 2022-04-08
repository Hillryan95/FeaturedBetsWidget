//
//  EventInformationView.swift
//  SBGWidgetTargetExtension
//
//  Created by Ryan Hill on 05/04/2022.
//

import SwiftUI

struct EventInformationView: View {
    var name: String
    var outcome: String
    var location: String
    var time: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.system(size: 12.0, weight: .semibold))
                .lineLimit(0)
                .padding(.bottom, 1.0)

            Text(outcome)
                .font(.system(size: 12.0, weight: .regular))
                .padding(.bottom, 1.0)

            Text("\(time) \(location)")
            .font(.system(size: 10.0, weight: .regular))
            .lineLimit(0)
            .padding(.bottom, 1.0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10.0)
        .padding(.leading, 5.0)
    }
}
