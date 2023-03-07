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
    @IBOutlet weak var weightsTextfield: UITextField!
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var infoButonOutlet: UIButton!
    
    var getExerciseGif = ""
    var exerciseNameText = ""
    var getExerciseDescription = ""
    
    var exerciseDescription = ""
    var exerciseImage: UIImage?
    var isTextFieldMovedUp = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.cornerRadius = 10
        doneButton.isHidden = true
        exerciseName.text = exerciseNameText
        backStaticsView.layer.cornerRadius = 10
        firstVidjet.layer.cornerRadius = 8
        secondVidjet.layer.cornerRadius = 8
        thirdVidjet.layer.cornerRadius = 8
        
        exerciseGif.loadGif(name: getExerciseGif)
        
        weightsTextfield.delegate = self
        repsTextField.delegate = self
        
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
    
    
    @IBAction func doneButtonAction(_ sender: Any) {
        weightsTextfield.resignFirstResponder()
        repsTextField.resignFirstResponder()
        doneButton.isHidden = true
        infoButonOutlet.isHidden = false
        if isTextFieldMovedUp {
            moveTextField(textField: weightsTextfield, moveDistance: -290, up: false)
            isTextFieldMovedUp = false
        }
    }
}

