//
//  AddView.swift
//  HabitTracker
//
//  Created by Raymond Chen on 3/3/22.
//

import SwiftUI
import Combine

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var habits: Habits
    
    @State private var name = ""
    @State private var sessions = "0"
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                TextField("Sessions", text: $sessions)
                    .keyboardType(.numberPad)
                    .onReceive(Just(sessions)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.sessions = filtered
                                    }
                    }
            }
            .toolbar {
                Button("Save") {
                    let item = Habit(name: name, sessions: Int(sessions) ?? 0)
                    habits.items.append(item)
                    dismiss()
                }
            }
        }
        .navigationTitle("Add new habit")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
