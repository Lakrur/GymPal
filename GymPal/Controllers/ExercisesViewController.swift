//
//  DescriptionExercisesViewController.swift
//  GymPal
//
//  Created by Yehor Krupiei on 04.03.2023.
//

import UIKit
import RealmSwift

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
    
    var selectedExercise: MuscleGroupExercises!
    var isTextFieldMovedUp = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.cornerRadius = 10
        doneButton.isHidden = true
        exerciseName.text = selectedExercise.name
        backStaticsView.layer.cornerRadius = 10
        firstVidjet.layer.cornerRadius = 8
        secondVidjet.layer.cornerRadius = 8
        thirdVidjet.layer.cornerRadius = 8
        
        exerciseGif.loadGif(name: selectedExercise.presentation)
        
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
            descriptionExercisesVC.exerciseDescription = selectedExercise.exerciseDescription
            descriptionExercisesVC.exerciseImage = UIImage(named: selectedExercise.image)
        }
    }
    
    func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
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
    
    
    @IBAction func saveReps(_ sender: Any) {
        
        guard repsTextField.text?.isEmpty == false else { return }
        guard weightsTextfield.text?.isEmpty == false else { return }
        
        selectedExercise.weight = weightsTextfield.text!
        selectedExercise.reps = repsTextField.text!
        
        print(selectedExercise!)
        
        let realm = try! Realm()
        try! realm.write {
            let saveExercise = MuscleGroupExercises()
            saveExercise.id = selectedExercise.id
            saveExercise.image = selectedExercise.image
            saveExercise.weight = selectedExercise.weight
            saveExercise.reps = selectedExercise.reps
            saveExercise.name = selectedExercise.name
            saveExercise.muscleGroup = selectedExercise.muscleGroup
            saveExercise.presentation = selectedExercise.presentation
            saveExercise.exerciseDescription = selectedExercise.exerciseDescription
            realm.add(saveExercise)
            showAlert(title: "Super!", message: "Your results for this exercise have been added. You can see the result in the Progress tab.")
        }
        
    }
}

