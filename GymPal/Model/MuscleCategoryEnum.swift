//
//  MuscleCategoryEnum.swift
//  GymPal
//
//  Created by Yehor Krupiei on 02.03.2023.
//

import Foundation
import UIKit

enum MuscleGroup: CaseIterable {
    
    case traps
    case lats
    case lowerBack
    case shoulders
    case chest
    case triceps
    case biceps
    case forearms
    case obliques
    case abdominals
    case quads
    case hamstrings
    case glutes
    case calves
    
    var image: UIImage {
        switch self {
        case .traps:
            return UIImage(named: "traps")!
        case .lats:
            return UIImage(named: "lats")!
        case .lowerBack:
            return UIImage(named: "lowerBack")!
        case .shoulders:
            return UIImage(named: "shoulders")!
        case .chest:
            return UIImage(named: "chest")!
        case .triceps:
            return UIImage(named: "triceps")!
        case .biceps:
            return UIImage(named: "biceps")!
        case .forearms:
            return UIImage(named: "forearms")!
        case .obliques:
            return UIImage(named: "obliques")!
        case .abdominals:
            return UIImage(named: "abdominals")!
        case .quads:
            return UIImage(named: "quads")!
        case .hamstrings:
            return UIImage(named: "hamstrings")!
        case .glutes:
            return UIImage(named: "glutes")!
        case .calves:
            return UIImage(named: "calves")!
        }
    }
    
    var title: String {
        switch self {
        case .traps:
            return "Traps"
        case .lats:
            return "Lats"
        case .lowerBack:
            return "Lower Back"
        case .shoulders:
            return "Shoulders"
        case .chest:
            return "Chest"
        case .triceps:
            return "Triceps"
        case .biceps:
            return "Biceps"
        case .forearms:
            return "Forearms"
        case .obliques:
            return "Obliques"
        case .abdominals:
            return "Abdominals"
        case .quads:
            return "Quads"
        case .hamstrings:
            return "Hamstrings"
        case .glutes:
            return "Glutes"
        case .calves:
            return "Calves"
        }
    }
}

