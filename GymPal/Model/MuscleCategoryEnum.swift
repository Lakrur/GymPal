//
//  MuscleCategoryEnum.swift
//  GymPal
//
//  Created by Yehor Krupiei on 02.03.2023.
//

import Foundation
import UIKit
import RealmSwift

enum MuscleGroup: Int, CaseIterable, PersistableEnum {
    
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

extension MuscleGroup: _Persistable {
    public static var defaultValue: MuscleGroup { return .traps }
    
    public static func fromPersistedType(_ persistedValue: Int) -> MuscleGroup? {
        switch persistedValue {
        case 0: return .traps
        case 1: return .lats
        case 2: return .lowerBack
        case 3: return .shoulders
        case 4: return .chest
        case 5: return .triceps
        case 6: return .biceps
        case 7: return .forearms
        case 8: return .obliques
        case 9: return .abdominals
        case 10: return .quads
        case 11: return .hamstrings
        case 12: return .glutes
        case 13: return .calves
        default: return nil
        }
    }
    
    public var persistedValue: Int {
        switch self {
        case .traps: return 0
        case .lats: return 1
        case .lowerBack: return 2
        case .shoulders: return 3
        case .chest: return 4
        case .triceps: return 5
        case .biceps: return 6
        case .forearms: return 7
        case .obliques: return 8
        case .abdominals: return 9
        case .quads: return 10
        case .hamstrings: return 11
        case .glutes: return 12
        case .calves: return 13
        }
    }
}
