//
//  MuscleGroupDetailViewController.swift
//  GymPal
//
//  Created by Yehor Krupiei on 02.03.2023.
//

import UIKit

class MuscleGroupDetailVC: UIViewController {
    
    var exercisesList: [MuscleGroupExercises]!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleMuscleGroup: UILabel!
    
    var muscleGroupsNames = ""
    var muscleGroup: MuscleGroup!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        
        titleMuscleGroup.text = muscleGroupsNames
        
        exercisesList = [
            MuscleGroupExercises(name: "Dumbell Seated Shrug",image: UIImage(named: "seatedShrug")!, description: "Sit on a bench with dumbbells in both hands, palms facing your body, back straight.Elevate your shoulders and hold the contracted position at the apex of the motion. Slowly lower your shoulders back to starting position.", muscleGroup: .traps),
            MuscleGroupExercises(name: "Dumbbell Shrug", image: UIImage(named: "dumbbellShrug")!, description: "Stand tall with two dumbbells. Pull your shoulder blades up. Give a one second squeeze at the top.", muscleGroup: .traps)]
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return exercisesList.filter({ $0.muscleGroup == muscleGroup }).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "muscleGroupExercises", for: indexPath) as? MuscleExercisesTableViewCell
        
        guard let tableViewCell = cell else { return UITableViewCell() }
        
        let exerciceList = exercisesList[indexPath.row]
        
        tableViewCell.exercisesImage.image = exerciceList.image
        tableViewCell.exercisesNameLabel.text = exerciceList.name
        
        return tableViewCell
    }

    

}

extension MuscleGroupDetailVC: UITableViewDelegate, UITableViewDataSource {
}
