//
//  SportsIconView.swift
//  SBGWidgetTargetExtension
//
//  Created by Ryan Hill on 05/04/2022.
//

import SwiftUI

struct SportsIconView: View {
    var sport: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.85))
                .frame(width: 30.0, height: 30.0)

            Text(sport)
                .font(.system(size: 12.0, weight: .regular))
        }
        .offset(x: 55, y: -55)
    }
}

