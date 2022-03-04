//
//  AddView.swift
//  HabitTracker
//
//  Created by Raymond Chen on 3/3/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var habits: Habits
    
    @State private var name = ""
    @State private var sessions = 0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                TextField("Sessions", value: $sessions, format: .number)
                    .keyboardType(.numberPad)
            }
            .toolbar {
                Button("Save") {
                    let item = Habit(name: name, sessions: sessions)
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
