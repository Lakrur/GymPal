//
//  DescriptionExercisesViewController.swift
//  GymPal
//
//  Created by Yehor Krupiei on 04.03.2023.
//

import UIKit

class DescriptionExercisesViewController: UIViewController {
    
    
    @IBOutlet weak var exercisePicture: UIImageView!
    @IBOutlet weak var exerciseLabel: UILabel!
    
    var exerciseDescription = ""
    var exerciseImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exercisePicture.image = exerciseImage
        exerciseLabel.text = exerciseDescription
        exerciseLabel.numberOfLines = 0
        
     
    }
    

   

}
