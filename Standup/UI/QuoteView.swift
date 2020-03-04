//
//  QuoteView.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/18/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import SwiftUI

struct QuoteView: View {
    enum Time {
        case daily
        case weekly
        case monthly
        
        var display: String {
            switch self {
            case .daily: return "Daily"
            case .weekly: return "Weekly"
            case .monthly: return "Monthly"
            }
        }
    }
    
    let quote: String
    let author: String
    let type: Time
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(type.display + " Quote").font(.headline)
            
            Text(quote).font(.callout).foregroundColor(Color(.secondaryLabel))
            
            HStack {
                Spacer()
                Text("- " + author).font(.footnote).foregroundColor(Color(.secondaryLabel))
            }
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: "\"Do the right thing, do it right, do it right now.\"", author: "Marcos", type: .daily)
    }
}
