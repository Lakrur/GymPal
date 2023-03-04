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
            // traps
            MuscleGroupExercises(name: "Dumbell Seated Shrugs",image: UIImage(named: "seatedShrug")!, description: "Sit on a bench with dumbbells in both hands, palms facing your body, back straight.Elevate your shoulders and hold the contracted position at the apex of the motion. Slowly lower your shoulders back to starting position.", muscleGroup: .traps, presentation: "DumbellSeatedShrugs"),
            MuscleGroupExercises(name: "Dumbbell Shrugs", image: UIImage(named: "dumbbellShrug")!, description: "Stand tall with two dumbbells. Pull your shoulder blades up. Give a one second squeeze at the top.", muscleGroup: .traps, presentation: "DumbbellShrugs"),
            MuscleGroupExercises(name: "Barbell Shrugs", image: UIImage(named: "barbellShrugs")!, description: "Position the safeties just below waist height in a rack. Assume a standing position with the bar in front of your body. Hinge forward, inhale, and grab the bar with a double overhand grip. Stand up tall and ensure your spine remains neutral. Contract the traps to elevate the shoulders. Squeeze hard at the top and slowly lower the bar back to the starting position. Repeat for the desired number of repetitions.", muscleGroup: .traps, presentation: "BarbellShrugs"),
            MuscleGroupExercises(name: "Behind the Back Shrugs", image: UIImage(named: "backShrugs")!, description: "A variation of the conventional shrug that places the source of resistance beind the exerciser’s back - this particular shrug variation allows for a greater activation of the triceps brachii while simultaneously reducing deltoid muscle involvement. As such, for exercisers wishing to train their trapezius muscle to an extent greater than what conventional shrugs can offer, this variation may be the most suitable.", muscleGroup: .traps, presentation: "BehindTheBackShrugs"),
            MuscleGroupExercises(name: "Overhead Shrugs", image: UIImage(named: "overheadShrugs")!, description: "On the opposite end of the spectrum to behind the back shrugs, overhead shrugs are a variation of the shrug that raises the weights over the exercisers head so as to activate the entirety of the upper and middle back musculature. Overhead shrugs are a more suitable alternative for exercisers that find the isolated muscular recruitment pattern of the conventional shrug to be inefficient and time consuming, allowing them to train the entirety of their back and shoulders in a single exercise.", muscleGroup: .traps, presentation: "OverheadShrugs"),
            // lats
            MuscleGroupExercises(name: "Pull Ups", image: UIImage(named: "pullUps")!, description: "", muscleGroup: .lats, presentation: "PullUps"),
            MuscleGroupExercises(name: "Machine Pulldown", image: UIImage(named: "machinePullDown")!, description: "", muscleGroup: .lats, presentation: "MachinePulldown"),
            MuscleGroupExercises(name: "Barbell Bent Over Row", image: UIImage(named: "barbellBentOverRow")!, description: "", muscleGroup: .lats, presentation: "BarbellBentOverRow"),
            MuscleGroupExercises(name: "Dumbbell Row Unilateral", image: UIImage(named: "dumbbellRowUnilateral")!, description: "", muscleGroup: .lats, presentation: "DumbbellRowUnilateral"),
            MuscleGroupExercises(name: "Machine Seated Cable Row", image: UIImage(named: "machineSeatedCableRow")!, description: "", muscleGroup: .lats, presentation: "MachineSeatedCableRow"),
            MuscleGroupExercises(name: "Cable Pullover", image: UIImage(named: "cablePullover")!, description: "", muscleGroup: .lats, presentation: "CablePullover"),
            MuscleGroupExercises(name: "Dumbbell Laying Incline Row", image: UIImage(named: "dumbbellLayingInclineRow")!, description: "", muscleGroup: .lats, presentation: "DumbbellLayingInclineRow"),
            // lower-back
            MuscleGroupExercises(name: "Barbell Deadlift", image: UIImage(named: "barbellDeadlift")!, description: "", muscleGroup: .lowerBack, presentation: "BarbellDeadlift"),
            MuscleGroupExercises(name: "Dumbbell Deadlift", image: UIImage(named: "dumbbellDeadlift")!, description: "", muscleGroup: .lowerBack, presentation: "DumbbellDeadlift"),
            MuscleGroupExercises(name: "Machine 45 Degree Back Extension", image: UIImage(named: "machineBackExtension")!, description: "", muscleGroup: .lowerBack, presentation: "Machine45DegreeBackExtension"),
            // shoulders
            MuscleGroupExercises(name: "Dumbbell Lateral Raise", image: UIImage(named: "dumbbellLateralRaise")!, description: "", muscleGroup: .shoulders, presentation: "DumbbellLateralRaise"),
            MuscleGroupExercises(name: "Dumbbell Seated Overhead Press", image: UIImage(named: "dumbbellSeatedOverhead")!, description: "", muscleGroup: .shoulders, presentation: "DumbbellSeatedOverheadPress"),
            MuscleGroupExercises(name: "Dumbbell Front Raise", image: UIImage(named: "dumbbellFrontRaise")!, description: "", muscleGroup: .shoulders, presentation: "DumbbellFrontRaise"),
            MuscleGroupExercises(name: "Reverse Butterfly", image: UIImage(named: "reverseButterfly")!, description: "", muscleGroup: .shoulders, presentation: "ReverseButterfly"),
            MuscleGroupExercises(name: "Barbell Overhead Press", image: UIImage(named: "barbellOverheadPress")!, description: "", muscleGroup: .shoulders, presentation: "BarbellOverheadPress"),
            MuscleGroupExercises(name: "Elevated Pike Press", image: UIImage(named: "elevatedPikePress")!, description: "", muscleGroup: .shoulders, presentation: "ElevatedPikePress"),
            MuscleGroupExercises(name: "Barbell Upright Row", image: UIImage(named: "barbellUprightRow")!, description: "", muscleGroup: .shoulders, presentation: "BarbellUprightRow"),
            // chest
            MuscleGroupExercises(name: "Push Up", image: UIImage(named: "pushUp")!, description: "", muscleGroup: .chest, presentation: "Push Up"),
            MuscleGroupExercises(name: "Barbell Bench Press", image: UIImage(named: "barbellBenchPress")!, description: "", muscleGroup: .chest, presentation: "Barbell Bench Press"),
            MuscleGroupExercises(name: "Dumbbell Incline Bench Press", image: UIImage(named: "dumbbellBenchPress")!, description: "", muscleGroup: .chest, presentation: "Dumbbell Incline Bench Press"),
            MuscleGroupExercises(name: "Dumbbell Incline Chest Flys", image: UIImage(named: "dumbbellChestFlys")!, description: "", muscleGroup: .chest, presentation: "Dumbbell Incline Chest Flys"),
            MuscleGroupExercises(name: "Barbell Incline Bench Press", image: UIImage(named: "barbellInclineBenchPress")!, description: "", muscleGroup: .chest, presentation: "Barbell Incline Bench Press"),
            MuscleGroupExercises(name: "Dips", image: UIImage(named: "dips")!, description: "", muscleGroup: .chest, presentation: "Dips"),
            MuscleGroupExercises(name: "Butterfly", image: UIImage(named: "butterfly")!, description: "", muscleGroup: .chest, presentation: "Butterfly"),
            MuscleGroupExercises(name: "Cable Crossover", image: UIImage(named: "cableCrossover")!, description: "", muscleGroup: .chest, presentation: "Cable Crossover"),
            // triceps
            MuscleGroupExercises(name: "Cable Push Down", image: UIImage(named: "cablePushDown")!, description: "", muscleGroup: .triceps, presentation: "Cable Push Down"),
            MuscleGroupExercises(name: "Dips", image: UIImage(named: "dips")!, description: "", muscleGroup: .triceps, presentation: "Dips"),
            MuscleGroupExercises(name: "Barbell Close Grip Bench Press", image: UIImage(named: "barbellGripBenchPress")!, description: "", muscleGroup: .triceps, presentation: "Barbell Close Grip Bench Press"),
            MuscleGroupExercises(name: "Bench Dips", image: UIImage(named: "benchDips")!, description: "", muscleGroup: .triceps, presentation: "Bench Dips"),
            MuscleGroupExercises(name: "Barbell Skullcrushers", image: UIImage(named: "skullCrushers")!, description: "", muscleGroup: .triceps, presentation: "Barbell Skullcrushers"),
            MuscleGroupExercises(name: "Cable Skullcrusher", image: UIImage(named: "cableSkullcrusher")!, description: "", muscleGroup: .triceps, presentation: "Cable Skullcrusher"),
            // biceps
            MuscleGroupExercises(name: "Barbell Curl", image: UIImage(named: "barbellCurl")!, description: "", muscleGroup: .biceps, presentation: "Barbell Curl"),
            MuscleGroupExercises(name: "Chin Ups", image: UIImage(named: "chinUps")!, description: "", muscleGroup: .biceps, presentation: "Chin Ups"),
            MuscleGroupExercises(name: "Dumbbell Curl", image: UIImage(named: "dumbbellCurl")!, description: "", muscleGroup: .biceps, presentation: "Dumbbell Curl"),
            MuscleGroupExercises(name: "Dumbbell Hammer Curl", image: UIImage(named: "dumbbellHammerCurl")!, description: "", muscleGroup: .biceps, presentation: "Dumbbell Hammer Curl"),
            MuscleGroupExercises(name: "Dumbbell Concentration Curl", image: UIImage(named: "dumbbellConcentrationCurl")!, description: "", muscleGroup: .biceps, presentation: "Dumbbell Concentration Curl"),
            MuscleGroupExercises(name: "Barbell Preacher Curl", image: UIImage(named: "barbellPreacherCurl")!, description: "", muscleGroup: .biceps, presentation: "Barbell Preacher Curl"),
            // forearms
            MuscleGroupExercises(name: "Dumbbell Wrist Extension", image: UIImage(named: "dumbbellWristExtension")!, description: "", muscleGroup: .forearms, presentation: "Dumbbell Wrist Extension"),
            MuscleGroupExercises(name: "Barbell Wrist Curl", image: UIImage(named: "barbellWristCurl")!, description: "", muscleGroup: .forearms, presentation: "Barbell Wrist Curl"),
            MuscleGroupExercises(name: "Barbell Behind The Back Wrist Curl", image: UIImage(named: "barbellBackWristCurl")!, description: "", muscleGroup: .forearms, presentation: "Barbell Behind The Back Wrist Curl"),
            //obliques
            MuscleGroupExercises(name: "Dumbbell Wood Chopper", image: UIImage(named: "dumbbellWoodChopper")!, description: "", muscleGroup: .obliques, presentation: "Dumbbell Wood Chopper"),
            MuscleGroupExercises(name: "Dumbbell Overhead Side Bend", image: UIImage(named: "dumbbellOverheadSideBend")!, description: "", muscleGroup: .obliques, presentation: "Dumbbell Overhead Side Bend"),
            MuscleGroupExercises(name: "Dumbbell Russian Twist", image: UIImage(named: "dumbbellRussianTwist")!, description: "", muscleGroup: .obliques, presentation: "Dumbbell Russian Twist"),
            // abdominals
            MuscleGroupExercises(name: "Hanging Knee Raises", image: UIImage(named: "hangingKneeRaises")!, description: "", muscleGroup: .abdominals, presentation: "Hanging Knee Raises"),
            MuscleGroupExercises(name: "Lying Leg Raises", image: UIImage(named: "lyingLegRaises")!, description: "", muscleGroup: .abdominals, presentation: "Lying Leg Raises"),
            MuscleGroupExercises(name: "Crunches", image: UIImage(named: "crunches")!, description: "", muscleGroup: .abdominals, presentation: "Crunches"),
            MuscleGroupExercises(name: "Machine Roll Outs", image: UIImage(named: "machineRollOuts")!, description: "", muscleGroup: .abdominals, presentation: "Machine Roll Outs"),
            MuscleGroupExercises(name: "Sit Ups", image: UIImage(named: "sitUps")!, description: "", muscleGroup: .abdominals, presentation: "Sit Ups"),
            // quads
            MuscleGroupExercises(name: "Barbell Squat", image: UIImage(named: "barbellSquat")!, description: "", muscleGroup: .quads, presentation: "Barbell Squat"),
            MuscleGroupExercises(name: "Forward Lunges", image: UIImage(named: "forwardLunges")!, description: "", muscleGroup: .quads, presentation: "Forward Lunges"),
            MuscleGroupExercises(name: "Machine Leg Extension", image: UIImage(named: "legExtension")!, description: "", muscleGroup: .quads, presentation: "Machine Leg Extension"),
            MuscleGroupExercises(name: "Machine Leg Press", image: UIImage(named: "legPress")!, description: "", muscleGroup: .quads, presentation: "Machine Leg Press"),
            MuscleGroupExercises(name: "Step Up", image: UIImage(named: "stepUp")!, description: "", muscleGroup: .quads, presentation: "Step Up"),
            // hamstrings
            MuscleGroupExercises(name: "Barbell Stiff Leg Deadlifts", image: UIImage(named: "stiffLegDeadlifts")!, description: "", muscleGroup: .hamstrings, presentation: "Barbell Stiff Leg Deadlifts"),
            MuscleGroupExercises(name: "Machine Hamstring Curl", image: UIImage(named: "hamstringCurl")!, description: "", muscleGroup: .hamstrings, presentation: "Machine Hamstring Curl"),
            MuscleGroupExercises(name: "Barbell Low Bar Good Morning", image: UIImage(named: "goodMorning")!, description: "", muscleGroup: .hamstrings, presentation: "Barbell Low Bar Good Morning"),
            MuscleGroupExercises(name: "Dumbbell Romanian Deadlift", image: UIImage(named: "romanianDeadlift")!, description: "", muscleGroup: .hamstrings, presentation: "Dumbbell Romanian Deadlift"),
            // glutes
            MuscleGroupExercises(name: "Barbell Squat", image: UIImage(named: "barbellSquat")!, description: "", muscleGroup: .glutes, presentation: "Barbell Squat"),
            MuscleGroupExercises(name: "Barbell Hip Thrust", image: UIImage(named: "barbellHipThrust")!, description: "", muscleGroup: .glutes, presentation: "Barbell Hip Thrust"),
            MuscleGroupExercises(name: "Forward Lunges", image: UIImage(named: "forwardLunges")!, description: "", muscleGroup: .glutes, presentation: "Forward Lunges"),
            MuscleGroupExercises(name: "Barbell Low Bar Good Morning", image: UIImage(named: "goodMorning")!, description: "", muscleGroup: .glutes, presentation: "Barbell Low Bar Good Morning"),
            MuscleGroupExercises(name: "Dumbbell Romanian Deadlift", image: UIImage(named: "romanianDeadlift")!, description: "", muscleGroup: .glutes, presentation: "Dumbbell Romanian Deadlift"),
            // calves
            MuscleGroupExercises(name: "Machine Standing Calf Raises", image: UIImage(named: "standingCalfRaises")!, description: "", muscleGroup: .calves, presentation: "Machine Standing Calf Raises"),
            MuscleGroupExercises(name: "Machine Seated Calf Raises", image: UIImage(named: "seatedCalfRaises")!, description: "", muscleGroup: .calves, presentation: "Machine Seated Calf Raises"),
            MuscleGroupExercises(name: "Dumbbell Calf Raise", image: UIImage(named: "dumbbellCalfRaise")!, description: "", muscleGroup: .calves, presentation: "Dumbbell Calf Raise")]
        
        exercisesList = exercisesList.filter { $0.muscleGroup == muscleGroup }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowExercisesDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let descriptionExercisesVC = segue.destination as! DescriptionExercisesViewController
                descriptionExercisesVC.getExerciseGif = exercisesList[indexPath.row].presentation
            }
        }
    }
    
    
}

extension MuscleGroupDetailVC: UITableViewDelegate, UITableViewDataSource {
}
