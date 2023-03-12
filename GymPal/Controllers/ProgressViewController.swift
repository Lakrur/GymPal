//
//  ProgressViewController.swift
//  GymPal
//
//  Created by Yehor Krupiei on 12.03.2023.
//

import UIKit


class ProgressViewController: UIViewController {
    
    var progressExercises: [MuscleGroupExercises]!

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return progressExercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as? ProgressTableViewCell
        
        guard let tableViewCell = cell else { return UITableViewCell() }
        
        // code
        
        return tableViewCell
    }
   
}

extension ProgressViewController: UITableViewDelegate, UITableViewDataSource {
}
