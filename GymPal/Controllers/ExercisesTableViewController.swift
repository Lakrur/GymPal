//
//  ViewController.swift
//  GymPal
//
//  Created by Yehor Krupiei on 01.03.2023.
//

import UIKit

class ExercisesTableViewController: UIViewController {
    
    var exercisesList: [ExercisesList]!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        exercisesList = [
        ExercisesList(image: UIImage(named: "traps")!, exercisesName: "Трапеция"),
        ExercisesList(image: UIImage(named: "traps(mid-back)")!, exercisesName: "Трапеция (Середина Спины)"),
        ExercisesList(image: UIImage(named: "lats")!, exercisesName: "Широчайшие"),
        ExercisesList(image: UIImage(named: "lowerBack")!, exercisesName: "Низ Спины"),
        ExercisesList(image: UIImage(named: "shoulders")!, exercisesName: "Плечи"),
        ExercisesList(image: UIImage(named: "chest")!, exercisesName: "Грудные Мышцы"),
        ExercisesList(image: UIImage(named: "triceps")!, exercisesName: "Трицепсы"),
        ExercisesList(image: UIImage(named: "biceps")!, exercisesName: "Бицепсы"),
        ExercisesList(image: UIImage(named: "forearms")!, exercisesName: "Предплечья"),
        ExercisesList(image: UIImage(named: "obliques")!, exercisesName: "Косые"),
        ExercisesList(image: UIImage(named: "abdominals")!, exercisesName: "Мышцы Пресса"),
        ExercisesList(image: UIImage(named: "quads")!, exercisesName: "Квадрицепс"),
        ExercisesList(image: UIImage(named: "hamstrings")!, exercisesName: "Мышцы Задней Поверхности Бедра"),
        ExercisesList(image: UIImage(named: "glutes")!, exercisesName: "Ягодицы"),
        ExercisesList(image: UIImage(named: "calves")!, exercisesName: "Икроножная")]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exercisesCell", for: indexPath) as? ExercisesTableViewCell
        
        guard let tableViewCell = cell else { return UITableViewCell() }
        
        let exerciceList = exercisesList[indexPath.row]
        
        tableViewCell.exercisesImage.image = exerciceList.image
        tableViewCell.exercisesNameLabel.text = exerciceList.exercisesName
        
        return tableViewCell
    }


}

extension ExercisesTableViewController: UITableViewDelegate, UITableViewDataSource {
}
