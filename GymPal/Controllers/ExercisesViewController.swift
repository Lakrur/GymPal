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
    
    
    var getExerciseGif = ""
    var exerciseNameText = ""
    var getExerciseDescription = ""
    
    var exerciseDescription = ""
    var exerciseImage: UIImage?
   
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
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "ShowExerciseDesription" {
               let descriptionExercisesVC = segue.destination as! DescriptionExercisesViewController
               descriptionExercisesVC.exerciseDescription = exerciseDescription
               descriptionExercisesVC.exerciseImage = exerciseImage
           }
       }
    
    @IBAction func infoButton(_ sender: Any) {
    }
   
    
}

