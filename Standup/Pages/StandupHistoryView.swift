//
//  StandupHistoryView.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/20/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import SwiftUI

struct StandupHistoryRow: View {
    let completed: Bool
    let score: Double
    let grateful: String?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Grateful for:").font(.headline).foregroundColor(Color(.secondaryLabel))
                    Text(grateful != nil ? grateful! : "Didn't add anything").font(.headline).foregroundColor(Color(.label))
                }
                
                HStack {
                    Text("Most Important Task: ").foregroundColor(Color(.secondaryLabel))
                    Spacer()
                    Text(completed ? "Completed" : "Incomplete").font(.headline).foregroundColor(completed ? .green : .red)
                }
                
                HStack {
                    Text("Overall Achievement Score: ").foregroundColor(Color(.secondaryLabel))
                    Spacer()
                    Text(String(score)).font(.headline).foregroundColor(Color(.label))
                }

            }.padding(5)
            
            Image(systemName: "chevron.right").foregroundColor(Color(.secondaryLabel))
        }
    }
}

struct StandupHistoryView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<3, id: \.self) { _ in
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Yesterday").font(.headline)
                            NavigationLink(destination: DailyDetailView(), label: {
                                StandupHistoryRow(completed: true, score: 4.5, grateful: "I'm greatful for having the opportunity to do what I do everyday.")
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(8)
                            })
                        }
                    }
                }
            }.padding().navigationBarTitle("Previous Standups", displayMode: .inline)
        }
    }
}

struct StandupHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        StandupHistoryView()
    }
}
