//
//  DailyStandupView.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/18/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import Foundation
import SwiftUI

struct DailyStandupView: View {
    @State var displayingHistory: Bool = false
    
    @State var mostImportantTask: String = ""
    
    @State var otherTasks: [DailyTask] = []
    
    @State var currentTask: String = ""
    
    @State var addingTask: Bool = false
    
    let formatter: DateFormatter = create {
        $0.dateStyle = .full
        $0.doesRelativeDateFormatting = true
    }
    
    var mostImportantTaskView: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Most Important Task")
                .font(.headline)
            
            Text("The task that you must focus on and execute today. If finished, this would give you an enormous sense of completion and satisfaction.")
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
            
            TextField("Write It Down...", text: $mostImportantTask)
        }
    }
    
    var tasksListHeaderView: some View {
        HStack {
            Text("Other Tasks").font(.headline)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    self.addingTask.toggle()
                    if !self.addingTask {
                        self.currentTask = ""
                    }
                }
            }, label: {
                if addingTask {
                    Text("Cancel")
                } else {
                    Image(systemName: "plus").imageScale(.large)
                }
            })
        }
    }
    
    var tasksListView: some View {
        ScrollView {
            ForEach(otherTasks, id: \.self) { task in
                HStack {
                    Image(systemName: task.completed ? "checkmark.circle.fill" : "checkmark.circle")
                        .foregroundColor(Color(task.completed ? .green : .systemGray3))
                    Text(String(task.title))
                    Spacer()
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .padding([.top, .bottom], 1)
                .animation(.easeInOut)
            }
            
            if addingTask {
                HStack {
                    TextField("Add Your Task...", text: $currentTask, onCommit: {
                        let task = DailyTask(title: self.currentTask, completed: false)
                        
                        self.otherTasks.append(task)
                        self.currentTask = ""
                        self.addingTask = false
                    })
                    
                    if !currentTask.isEmpty {
                        Button(action: {
                            self.currentTask = ""
                        }, label: { Image(systemName: "xmark.circle") })
                    }
                }
            }
        }
    }
    
    var leadingNavigationButton: some View {
        Button(action: { self.displayingHistory.toggle() }, label: {
            Image(systemName: "rectangle.stack.fill")
        })
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 24) {
                DateView()
                
                mostImportantTaskView
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    tasksListHeaderView
                    
                    tasksListView
                }
            }
            .padding(16)
            .navigationBarTitle("Standup")
            .navigationBarItems(trailing: leadingNavigationButton)
            .sheet(isPresented: $displayingHistory, content: {
                StandupHistoryView()
            })
        }
    }
}

struct DailyStandupView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DailyStandupView()
        }
    }
}
