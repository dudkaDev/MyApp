//
//  WorkoutModel.swift
//  MyApp
//
//  Created by Андрей Абакумов on 27.02.2023.
//

import RealmSwift

class WorkoutModel: Object {
    @Persisted var workoutDate: Date
    @Persisted var workoutNumberOfDay : Int = 0
    @Persisted var workoutName : String = "Unknown"
    @Persisted var workoutRepeat: Bool = true
    @Persisted var workoutSets: Int = 0
    @Persisted var workoutReps: Int = 0
    @Persisted var workoutTimer: Int = 0
    @Persisted var workoutImage: Data?
    @Persisted var workoutStatus: Bool = false
}
