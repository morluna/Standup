//
//  DailyTask.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/19/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import Foundation

struct DailyTask: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let completed: Bool
}
