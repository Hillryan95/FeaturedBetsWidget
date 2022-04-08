//
//  AddToBetslipView.swift
//  SBGWidgetTargetExtension
//
//  Created by Ryan Hill on 05/04/2022.
//

import SwiftUI

struct AddToBetslipView: View {
    var price: String
    
    var body: some View {
        VStack(alignment: .center) {
            Divider()
            Text("Add to Bet Slip ")
                .font(.system(size: 12.0, weight: .semibold))
            Text(price)
                .font(.system(size: 12.0, weight: .semibold))
                .foregroundColor(.red)
        }
        .frame(width: .infinity, height: .infinity, alignment: .center)
        .padding(.bottom, 10.0)
    }
}
