//
//  ProgressViewController.swift
//  GymPal
//
//  Created by Yehor Krupiei on 12.03.2023.
//

import UIKit
import RealmSwift


class ProgressViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var progressExercises: [MuscleGroupExercises] = []
    var selectedExerciseId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    
        
        let realm = try! Realm()
        for id in 1...70 {
            
            if let exercise = realm.objects(MuscleGroupExercises.self).filter("id == %@", id).first {
               
                if !progressExercises.contains(where: { $0.id == exercise.id }) {
                    progressExercises.append(exercise)
                }
            }
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return progressExercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as? ProgressTableViewCell
        
        guard let tableViewCell = cell else { return UITableViewCell() }
        
        tableViewCell.exercisesNameLabel.text = progressExercises[indexPath.row].name
        tableViewCell.exercisesImage.image = UIImage(named: progressExercises[indexPath.row].image)
        
        return tableViewCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProgressDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let progressDetailVC = segue.destination as! ProgressDetailViewController
                let selectedExercise = progressExercises[indexPath.row]
                let realm = try! Realm()
                let filteredSaves = realm.objects(MuscleGroupExercises.self).filter("id == %@", selectedExercise.id)
                progressDetailVC.selectedSaves = Array(filteredSaves)
                progressDetailVC.name = progressExercises[indexPath.row].name
            }
        }
    }
    
}

extension ProgressViewController: UITableViewDelegate, UITableViewDataSource {
}

