//
//  StandupContainerView.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/19/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import SwiftUI

struct StandupContainerView: View {
    enum ViewMode: CaseIterable {
        case standup
        case reflection
        
        var display: String {
            switch self {
            case .standup:
                return "Standup"
            case .reflection:
                return "Reflection"
            }
        }
    }
    
    @State var mode: ViewMode = .standup
    
    var body: some View {
        ZStack {
            if mode == .standup {
                DailyStandupView()
            } else {
                DailyReflectionView()
            }
            
            VStack {
                Spacer()
                Picker(selection: $mode, label: Text("")) {
                    ForEach(ViewMode.allCases, id: \.self) {
                        Text(String($0.display)).font(.headline)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.leading, .trailing], 30)
                .padding(.bottom, 16)
                .cornerRadius(10)
            }
        }
    }
}

struct StandupContainerView_Previews: PreviewProvider {
    static var previews: some View {
        StandupContainerView()
    }
}
