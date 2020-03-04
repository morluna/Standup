//
//  ActionButton.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/18/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import SwiftUI

struct ActionButton: View {
    let title: String
    let action: (() -> Void)
    
    var body: some View {
        Button(action: action, label : {
            HStack {
                Spacer()
                Text(title).foregroundColor(.white).font(.headline)
                Spacer()
            }.padding([.top, .bottom], 12)
        })
        .background(Color(.link))
        .cornerRadius(8)
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(title: "Continue", action: {})
    }
}
