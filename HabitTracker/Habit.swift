//
//  Habit.swift
//  HabitTracker
//
//  Created by Raymond Chen on 3/3/22.
//

import Foundation

struct Habit: Codable, Identifiable {
    var id = UUID()
    let name: String
    let sessions: Int
}


