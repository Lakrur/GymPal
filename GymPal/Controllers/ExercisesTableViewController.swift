//
//  ViewController.swift
//  GymPal
//
//  Created by Yehor Krupiei on 01.03.2023.
//

import UIKit

class ExercisesTableViewController: UIViewController {
    
    var muscleGroupsList: [MuscleGroupWorkouts]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        muscleGroupsList = [
            MuscleGroupWorkouts(image: UIImage(named: "traps")!, exercisesName: "Traps", muscleGroup: .traps),
            MuscleGroupWorkouts(image: UIImage(named: "lats")!, exercisesName: "Lats", muscleGroup: .lats),
            MuscleGroupWorkouts(image: UIImage(named: "lowerBack")!, exercisesName: "Lower Back", muscleGroup: .lowerBack),
            MuscleGroupWorkouts(image: UIImage(named: "shoulders")!, exercisesName: "Shoulders", muscleGroup: .shoulders),
            MuscleGroupWorkouts(image: UIImage(named: "chest")!, exercisesName: "Chest", muscleGroup: .chest),
            MuscleGroupWorkouts(image: UIImage(named: "triceps")!, exercisesName: "Triceps", muscleGroup: .triceps),
            MuscleGroupWorkouts(image: UIImage(named: "biceps")!, exercisesName: "Biceps", muscleGroup: .biceps),
            MuscleGroupWorkouts(image: UIImage(named: "forearms")!, exercisesName: "Forearms", muscleGroup: .forearms),
            MuscleGroupWorkouts(image: UIImage(named: "obliques")!, exercisesName: "Obliques", muscleGroup: .obliques),
            MuscleGroupWorkouts(image: UIImage(named: "abdominals")!, exercisesName: "Abdominals", muscleGroup: .abdominals),
            MuscleGroupWorkouts(image: UIImage(named: "quads")!, exercisesName: "Quads", muscleGroup: .quads),
            MuscleGroupWorkouts(image: UIImage(named: "hamstrings")!, exercisesName: "Hamstrings", muscleGroup: .hamstrings),
            MuscleGroupWorkouts(image: UIImage(named: "glutes")!, exercisesName: "Glutes", muscleGroup: .glutes),
            MuscleGroupWorkouts(image: UIImage(named: "calves")!, exercisesName: "Calves", muscleGroup: .calves)]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muscleGroupsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exercisesCell", for: indexPath) as? ExercisesTableViewCell
        
        guard let tableViewCell = cell else { return UITableViewCell() }
        
        let exerciceList = muscleGroupsList[indexPath.row]
        
        tableViewCell.exercisesImage.image = exerciceList.image
        tableViewCell.exercisesNameLabel.text = exerciceList.exercisesName
        
        return tableViewCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMuscleGroupDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let muscleGroupDetailVC = segue.destination as! MuscleGroupDetailVC
                muscleGroupDetailVC.muscleGroupsNames = muscleGroupsList[indexPath.row].exercisesName
                muscleGroupDetailVC.muscleGroup = muscleGroupsList[indexPath.row].muscleGroup
            }
        }
    }
    
}

extension ExercisesTableViewController: UITableViewDelegate, UITableViewDataSource {
}
