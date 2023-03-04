//
//  DescriptionExercisesViewController.swift
//  GymPal
//
//  Created by Yehor Krupiei on 04.03.2023.
//

import UIKit

class ExercisesViewController: UIViewController {
    
    
    @IBOutlet weak var exerciseGif: UIImageView!
    @IBOutlet weak var exerciseName: UILabel!
    @IBOutlet weak var backStaticsView: UIView!
    @IBOutlet weak var firstVidjet: UIView!
    @IBOutlet weak var secondVidjet: UIView!
    @IBOutlet weak var thirdVidjet: UIView!
    
    @IBOutlet weak var exerciseDescriptionLabel: UILabel!
    @IBOutlet weak var exerciseImage: UIImageView!
    
    
    
    
    var getExerciseGif = ""
    var exerciseNameText = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        exerciseName.text = exerciseNameText
        backStaticsView.layer.cornerRadius = 10
        firstVidjet.layer.cornerRadius = 8
        secondVidjet.layer.cornerRadius = 8
        thirdVidjet.layer.cornerRadius = 8
        
        exerciseGif.loadGif(name: getExerciseGif)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func infoButton(_ sender: Any) {
        
    }
    
}

