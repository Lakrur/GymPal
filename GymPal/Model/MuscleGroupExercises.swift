//
//  MuscleGroupExercises.swift
//  GymPal
//
//  Created by Yehor Krupiei on 02.03.2023.
//

import Foundation
import UIKit
import RealmSwift

class MuscleGroupExercises: Object {
    
    @Persisted var name: String
    @Persisted var image: String
    @Persisted var exerciseDescription: String
    @Persisted var muscleGroup: MuscleGroup
    @Persisted var presentation: String
    @Persisted var reps: String?
    @Persisted var weight: String?
    @Persisted var id: Int
    
    convenience init(name: String, image: String, exerciseDescription: String, muscleGroup: MuscleGroup, presentation: String, id: Int) {
        self.init()
        self.name = name
        self.image = image
        self.exerciseDescription = exerciseDescription
        self.muscleGroup = muscleGroup
        self.presentation = presentation
        self.id = id
    }
    
}
