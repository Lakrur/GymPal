//
//  DescriptionExercisesViewController.swift
//  GymPal
//
//  Created by Yehor Krupiei on 04.03.2023.
//

import UIKit

class DescriptionExercisesViewController: UIViewController {
    
    
    @IBOutlet weak var exerciseGif: UIImageView!
    
    var getExerciseGif = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exerciseGif.loadGif(name: getExerciseGif)
      
    }
    

    
}
