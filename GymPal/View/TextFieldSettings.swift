//
//  TextFieldSettings .swift
//  GymPal
//
//  Created by Yehor Krupiei on 07.03.2023.
//

import Foundation
import UIKit

extension ExercisesViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == weightsTextfield || textField == repsTextField {
            let currentText = textField.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            let maxLength = textField == weightsTextfield ? 5 : 2
            let withinMaxLength = newText.count <= maxLength
            return withinMaxLength
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if !isTextFieldMovedUp {
            moveTextField(textField: textField, moveDistance: -290, up: true)
            isTextFieldMovedUp = true
            doneButton.isHidden = false
            infoButonOutlet.isHidden = true
        }
    }
    
    func moveTextField(textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        UIView.commitAnimations()
    }
}



