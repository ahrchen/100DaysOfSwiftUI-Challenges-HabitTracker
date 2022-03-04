//
//  ContentView.swift
//  HabitTracker
//
//  Created by Raymond Chen on 3/3/22.
//
//Start with your data: define a struct that holds a single activity, and a class that holds an array of activities.

import SwiftUI

struct ContentView: View {
    
    struct ListView: View {
        var habit: Habit
        
        var body: some View {
            HStack {
                Text(habit.name)
                Spacer()
                Text("Sessions: \(habit.sessions)")
            }
        }
    }
    
    @StateObject var habits = Habits()
    
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { item in
                    ListView(habit: item)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("HabitTracker")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label : {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddHabit) {
            AddView(habits: habits)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
