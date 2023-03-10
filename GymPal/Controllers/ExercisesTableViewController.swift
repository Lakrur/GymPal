//
//  ViewController.swift
//  GymPal
//
//  Created by Yehor Krupiei on 01.03.2023.
//

import UIKit

class ExercisesTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.white
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MuscleGroup.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exercisesCell", for: indexPath) as? ExercisesTableViewCell
        
        guard let tableViewCell = cell else { return UITableViewCell() }
        
        tableViewCell.exercisesImage.image = MuscleGroup.allCases[indexPath.row].image
        tableViewCell.exercisesNameLabel.text = MuscleGroup.allCases[indexPath.row].title
        
        return tableViewCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMuscleGroupDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let muscleGroupDetailVC = segue.destination as! MuscleGroupDetailVC
                muscleGroupDetailVC.muscleGroupsNames = MuscleGroup.allCases[indexPath.row].title
                muscleGroupDetailVC.muscleGroup = MuscleGroup.allCases[indexPath.row].self
            }
        }
    }
    
}

extension ExercisesTableViewController: UITableViewDelegate, UITableViewDataSource {
}
