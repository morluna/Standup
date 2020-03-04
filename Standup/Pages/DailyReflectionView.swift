//
//  ContentView.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/18/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import SwiftUI

struct DailyReflectionView: View {
    @State var displayingHistory: Bool = false
    @State var gratitude: String = ""
    @State var physicalScore: Int = 0
    @State var energyScore: Int = 0
    @State var productivityScore: Int = 0
    @State var satisfactionScore: Int = 0
    
    var leadingNavigationButton: some View {
        Button(action: { self.displayingHistory.toggle() }, label: {
            Image(systemName: "rectangle.stack.fill")
        })
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 24) {
                    DateView()
   
                    DailySurveyInputView(title: "Gratitude",
                                         subtitle: "What made you grateful for the day?",
                                         response: $gratitude)
                    
                    DailySurveyPickerView(title: "Physical Score",
                                          subtitle: "Did you take good care of your body today?",
                                          selection: $physicalScore)
                    
                    DailySurveyPickerView(title: "Energy Score",
                                          subtitle: "Did you have optimal energy levels to complete daily tasks?",
                                          selection: $energyScore)
                    
                    DailySurveyPickerView(title: "Productivity Score",
                                          subtitle: "How productive were you today?",
                                          selection: $productivityScore)
                    
                    DailySurveyPickerView(title: "Satisfaction Score",
                                          subtitle: "How happy and satisfied are you with how this day went?",
                                          selection: $satisfactionScore)
                    
                    QuoteView(quote: "\"Do the right thing, do it right, do it right now.\"",
                              author: "Marcos",
                              type: .daily)
                    
                }.padding([.leading, .trailing], 16)
                
            }
            .navigationBarTitle("Reflection")
            .navigationBarItems(trailing: leadingNavigationButton)
            .sheet(isPresented: $displayingHistory, content: {
                StandupHistoryView()
            })
        }
    }
}

struct DailyReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DailyReflectionView()
        }
    }
}
