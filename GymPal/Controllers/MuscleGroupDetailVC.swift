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
            MuscleGroupExercises(name: "Dumbell Seated Shrugs",image: UIImage(named: "seatedShrug")!, description: "From a seated position, grasp a dumbbell in each hand and hold them to either side of your body. Keeping your body upright, shrug your shoulders as high as you can. Squeeze at the peak contraction before lowering the dumbbells slowly to the start position. Avoid using momentum to lift the weight and allow the weight you stretch your traps before pulling up for another repetition.", muscleGroup: .traps, presentation: "DumbellSeatedShrugs"),
            MuscleGroupExercises(name: "Dumbbell Shrugs", image: UIImage(named: "dumbbellShrug")!, description: "Begin with your feet underneath your hips, standing tall with the dumbbells at your sides and palms facing inwards (neutral grip).Engage your core by drawing your belly button to your spine.Initiate the movement by drawing your shoulders upwards whilst keeping the chest open and chin in place. Avoid rounding the shoulders and jutting your chin forward. Lift the shoulders to the end of your range of movement, this is very individual so it’s important to work within your capabilities.Squeeze the traps at the top of the movement for a beat and then reverse the movement slowly. This ensures the reps are controlled and maximises on the eccentric (downward) portion of the rep.", muscleGroup: .traps, presentation: "DumbbellShrugs"),
            MuscleGroupExercises(name: "Barbell Shrugs", image: UIImage(named: "barbellShrugs")!, description: "Nothing is better for building the traps than heavy weight. As long as you use good form on the movement, then the heavier the better. Most powerlifters have big traps because of all of the heavy deadlifts they do. Johnnie Jackson is a perfect example of this. He has said he actually doesn't train traps at all and his traps are huge. Whether you choose to train the traps or not is up to you. If you do decide to then you want to do barbell shrugs because you can go heavy on them and nothing is better for building those traps up. Stand up straight with your feet at shoulder width as you hold a barbell with both hands in front of you using a pronated-grip (palms facing the thighs). Tip: Your hands should be a little wider than shoulder width apart. You can use wrist wraps for this exercise for a better grip. This will be your starting position. Raise your shoulders up as far as you can go as you breathe out and hold the contraction for a second.", muscleGroup: .traps, presentation: "BarbellShrugs"),
            MuscleGroupExercises(name: "Behind the Back Shrugs", image: UIImage(named: "backShrugs")!, description: "Stand up straight with your feet at shoulder width as you hold a barbell with both hands behind your back using a pronated grip (palms facing back). Tip: Your hands should be a little wider than shoulder width apart. You can use wrist wraps for this exercise for better grip. This will be your starting position. Raise your shoulders up as far as you can go as you breathe out and hold the contraction for a second. Tip: Refrain from trying to lift the barbell by using your biceps. The arms should remain stretched out at all times. Slowly return to the starting position as you breathe in. Repeat for the recommended amount of repetitions. Variations: You can also rotate your shoulders as you go up, going in a semicircular motion from rear to front. However this version is not good for people with shoulder problems. In addition, this exercise can be performed with the barbell in front of your thighs, with dumbbells by the side, a smith machine or with a shrug machine.", muscleGroup: .traps, presentation: "Behind The Back Shrugs"),
            MuscleGroupExercises(name: "Overhead Shrugs", image: UIImage(named: "overheadShrugs")!, description: "Unrack the bar in a front rack position and press overhead to lockout with a double overhand grip. Inhale and contract the traps to elevate the shoulders. Slowly lower the bar back to the starting position and repeat for the desired number of repetitions. The traps tend to respond well to high reps and explosive movements (e.g. snatch grip high pulls) so program your accessory work accordingly. Limit momentum and excessive jerking or bouncing of the weight. No one cares about how much you shrug. Don’t allow the head to jut forward excessively as you squeeze the traps, this can put the neck in a compromised position and result in an injury. Adding a pause at the top of the movement can help to enhance the mind muscle connection.", muscleGroup: .traps, presentation: "OverheadShrugs"),
            // lats
            MuscleGroupExercises(name: "Pull Ups", image: UIImage(named: "pullUps")!, description: "Start by standing directly below a pull-up bar. Place your hands in an overhand grip with your hands slightly further than shoulder-width apart. If you can’t reach the bar from standing on the floor, you can place a box beneath you and stand on that. Once your hands are holding onto the bar, you’re in your starting position. Inhale, then exhale. Lift your feet up from the floor or box so that you’re hanging from the bar, and engage your core by pulling your belly button in toward your spine. Pull your shoulders back and down. Engaging the muscles in your arms and back, bend your elbows and raise your upper body up toward the bar until your chin is over the bar. You can imagine bringing your elbows toward your hips if that makes the movement easier. As you move, avoid swinging your legs around or shrugging your shoulders up. You want to make sure your shoulder blades remain back and down throughout the exercise.Then extend your elbows and lower your body back down to the starting position. ", muscleGroup: .lats, presentation: "PullUps"),
            MuscleGroupExercises(name: "Machine Pulldown", image: UIImage(named: "machinePullDown")!, description: "Grasp the bar with a wide grip with an overhand, knuckles-up grip. Other positions and grips are possible but start with this standard position. Pull the bar down until it's approximately level with the chin. Exhale on the downward motion. While shifting slightly backward is OK, aim to keep your upper torso stationary. Keep your feet flat on the floor and engage your abs as you pull. The bottom of the motion should be where your elbows can't move downward anymore without moving backward. Be sure to stop at that point and do not go lower. Squeeze the shoulder blades together while maintaining square shoulders. From the bottom position, with the bar close to your chin, slowly return the bar to the starting position while controlling its gradual ascent. Don't let it crash into the weight plates.", muscleGroup: .lats, presentation: "MachinePulldown"),
            MuscleGroupExercises(name: "Barbell Bent Over Row", image: UIImage(named: "barbellBentOverRow")!, description: "Hold onto a barbell with your palms facing down. Bend your knees slightly and bend forward at the waist while keeping your back straight. It should be almost parallel with the floor. The barbell should be directly in front of you; your arms should be perpendicular to the floor. This is the starting position. While keeping your torso stationary, lift the barbell toward you. Your elbows should be kept close to your body. Use only your forearms to hold the weight. When you get to the top, squeeze your back muscles and hold for a few seconds. Slowly lower the barbell back to the starting position. Repeat the process for the number of repetitions in your workout routine.", muscleGroup: .lats, presentation: "BarbellBentOverRow"),
            MuscleGroupExercises(name: "Dumbbell Row Unilateral", image: UIImage(named: "dumbbellRowUnilateral")!, description: "Hold a dumbbell in each hand, shoulder-width, with your palms facing each other. Bend over at a 45-degree angle (no lower) and take a deep breath in. Pull the dumbbells up, toward the sides of your chest, or beside the bottom of your rib cage on an exhale. Lift to the point your range of motion allows.", muscleGroup: .lats, presentation: "DumbbellRowUnilateral"),
            MuscleGroupExercises(name: "Machine Seated Cable Row", image: UIImage(named: "machineSeatedCableRow")!, description: "Sit on the bench with your knees bent and grasp the cable attachment. It often has a triangle handle, but it may be a bar. Position yourself with your knees slightly bent, so you have to reach to grab the handle with outstretched arms without curling the lower back over. Brace the abdominals, and you're ready to row. Pull the handle and weight back toward the lower abdomen while trying not to use the momentum of the row too much by moving the torso backward with the arms. Target the middle to upper back by keeping your back straight and squeezing your shoulder blades together as you row, keeping your chest out. Return the handle forward under tension to full stretch, remembering to keep that back straight even though flexed at the hips. Repeat the exercise for the desired number of repetitions.", muscleGroup: .lats, presentation: "MachineSeatedCableRow"),
            MuscleGroupExercises(name: "Cable Pullover", image: UIImage(named: "cablePullover")!, description: "Face a cable machine with a straight bar attachment slightly higher than head height (for most, this will have the cable pulley at the top of the machine). From here, grab the handle with an overhand grip (about shoulder-width apart) and take a step or two back away from the machine. With the core engaged and shoulders down and back, set feet shoulder width apart and hinge forward slightly. Now, keep your arms straight and pull the bar down - pulling with your lats! Once the straight bar handle attachment reaches your thighs, pause for a moment as you squeeze your lats, then slowly let your arms return to the start position, maintaining your forward hip hinge until all of your reps are complete. Once you have completed your desired number of repetitions, you can then slowly return to an upright position while allowing the bar handle attachment to carefully return to the top (don't just let it go and whip back up, obviously).", muscleGroup: .lats, presentation: "CablePullover"),
            MuscleGroupExercises(name: "Dumbbell Laying Incline Row", image: UIImage(named: "dumbbellLayingInclineRow")!, description: "Set up a bench at a 45° angle and lie face down on it so your chest is in full contact with the bench with your feet on the floor behind you. Let your arms hang down, holding a set of dumbbells with your palms facing each other. Row the weights up by squeezing your shoulder blades together and bringing your elbows back until your upper arms are level with or slightly higher than your torso. Slowly lower the weights back to the start. While the bench is supporting you during the exercise, that doesn’t mean you don’t need to be conscious of your body position. Focus on keeping your chest and abs pressed into the bench – in particular, don’t let your lower back arch away from the bench. This will ensure the exercise isolates the back muscles and stops you creating momentum to assist the lift.", muscleGroup: .lats, presentation: "DumbbellLayingInclineRow"),
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
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
                let exercisesVC = segue.destination as! ExercisesViewController
                exercisesVC.getExerciseGif = exercisesList[indexPath.row].presentation
                exercisesVC.exerciseNameText = exercisesList[indexPath.row].name
                exercisesVC.exerciseDescription = exercisesList[indexPath.row].description
                exercisesVC.exerciseImage = exercisesList[indexPath.row].image
                
            }
        }
    }
    
    
}

extension MuscleGroupDetailVC: UITableViewDelegate, UITableViewDataSource {
}
