//
//  ProgressDetailViewController.swift
//  GymPal
//
//  Created by Yehor Krupiei on 21.03.2023.
//

import UIKit
import RealmSwift

class ProgressDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var exerciseName: UILabel!
    
    var name = ""
    
    var selectedSaves: [MuscleGroupExercises] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        
        exerciseName.text = name
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedSaves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailprogcell", for: indexPath) as? ProgressDetailTableViewCell
        
        guard let tableViewCell = cell else { return UITableViewCell() }
        
        tableViewCell.view.layer.cornerRadius = 15
        tableViewCell.secondView.layer.cornerRadius = 15
        tableViewCell.reps.text = selectedSaves[indexPath.row].reps
        tableViewCell.weights.text = selectedSaves[indexPath.row].weight
        
        
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let realm = try! Realm()
            let save = selectedSaves[indexPath.row]
            
            do {
                try realm.write {
                    realm.delete(save)
                }
                
                selectedSaves.remove(at: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                tableView.reloadData()
                
                if let parent = navigationController?.viewControllers.first as? ProgressViewController {
                    parent.progressExercises = selectedSaves
                    parent.tableView.reloadData()
                }
                
            } catch {
                print("Error deleting item, \(error)")
            }
        }
    }
}

extension ProgressDetailViewController: UITableViewDelegate, UITableViewDataSource {
}

