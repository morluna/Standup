//
//  DailySurveyPickerView.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/18/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import SwiftUI

struct DailySurveyPickerView: View {
    let title: String
    let subtitle: String
    
    @Binding var selection: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).font(.headline)
            Text(subtitle)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color(.secondaryLabel))
            
            Picker(selection: $selection, label: Text("")) {
                ForEach(1...5, id: \.self) { Text(String($0)) }
            }.pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct DailySurveyPickerView_Previews: PreviewProvider {
    @State static var score: Int = 0
    
    static var previews: some View {
        DailySurveyPickerView(title: "Productivity Score",
                              subtitle: "How productive were you today?",
                              selection: $score)
    }
}
