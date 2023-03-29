//
//  RealmManager.swift
//  MyApp
//
//  Created by Андрей Абакумов on 27.02.2023.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    private init() {}
    
    let realm = try! Realm()
    
    func getResultsWorkoutModel() -> Results<WorkoutModel> {
        realm.objects(WorkoutModel.self)
    }

    func saveWorkoutModel(_ model: WorkoutModel) {
        try! realm.write {
            realm.add(model)
        }
    }
    
    func deleteWorkoutModel(_ model: WorkoutModel) {
        try! realm.write {
            realm.delete(model)
        }
    }
    
    func updateSetsRepsWorkoutModel(model: WorkoutModel, sets: Int, reps: Int) {
        try! realm.write {
            model.workoutSets = sets
            model.workoutReps = reps
        }
    }
    
    func updateSetsTimerWorkoutModel(model: WorkoutModel, sets: Int, timer: Int) {
        try! realm.write {
            model.workoutSets = sets
            model.workoutTimer = timer
        }
    }
    
    func updateStatusWorkoutModel(model: WorkoutModel) {
        try! realm.write {
            model.workoutStatus = true
        }
    }
}
