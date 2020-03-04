//
//  DailySurveyInputView.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/18/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import SwiftUI

struct DailySurveyInputView: View {
    let title: String
    let subtitle: String
    
    @Binding var response: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).font(.headline)
            TextField(subtitle, text: $response)
        }
    }
}

struct DailySurveyInputView_Previews: PreviewProvider {
    @State static var response: String = ""
    
    static var previews: some View {
        DailySurveyInputView(title: "Gratitude",
                             subtitle: "What made you grateful for the day?",
                             response: $response)
    }
}
