//
//  ContentView.swift
//  HabitTracker
//
//  Created by Raymond Chen on 3/3/22.
//
//Start with your data: define a struct that holds a single activity, and a class that holds an array of activities.

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(habits.items.count)")
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
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
