//
//  DailyDetailView.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/20/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import SwiftUI

struct DailyDetailView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Hello World")
                    .font(.headline)
                    
            }
        }.navigationBarTitle("Yesterday")
    }
}

struct DailyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DailyDetailView()
    }
}
