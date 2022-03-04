//
//  DetailView.swift
//  HabitTracker
//
//  Created by Raymond Chen on 3/3/22.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var habits: Habits
    let habit: Habit
    
    var body: some View {
        VStack {
            Spacer()
            Text("You have completed \(habit.sessions) sessions")
            Spacer()
            Button {
                let temp_habit = Habit(name: habit.name, sessions: habit.sessions + 1)
                if let habit_index = habits.items.firstIndex(of: habit) {
                    habits.items[habit_index] = temp_habit
                }
            } label : {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .padding()
            }
            
            
        }
        .navigationTitle(habit.name)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(habits: Habits(), habit: Habit(name: "Test", sessions: 1))
    }
}
