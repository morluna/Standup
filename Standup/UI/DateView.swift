//
//  DateView.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/18/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import SwiftUI

struct DateView: View {
    let formatter: DateFormatter = create {
        $0.dateStyle = .full
    }
    
    var body: some View {
        HStack {
            Text(formatter.string(from: Date())).multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
