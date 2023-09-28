//
//  ViewController.swift
//  TextValidation
//
//  Created by Dax Gerber on 9/28/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var PasswordShhhhh: UITextField!
    @IBOutlet weak var topLabel: UILabel!
    var passwordIsValid = false
    
    @IBOutlet weak var chase: UIImageView!
    var usernameIsvalid = false
    let charset = CharacterSet(charactersIn: "!@#$%^&*()_-+=/?><~`[]{}.,")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var imageExcellent: UIImageView!
    
    @IBAction func Login(_ sender: UIButton) {
        validatePassword()
        validateUsername()
        if passwordIsValid && usernameIsvalid {
            imageExcellent.image = UIImage(named: "excellent")
            Task {
                await delayText()
            }
        } else {
            imageExcellent.image = UIImage(named: "")
        }
    }
    func delayText() async {
        try? await Task.sleep(nanoseconds: 2_500_000_000)
        imageExcellent.image = UIImage(named: "evilLaugh")
    }
    
    func validateUsername() {
        if Username.text == nil || Username.text == "" {
            usernameIsvalid = false
            setLabel()
        } else {
            if Username.text!.contains(".com") && Username.text!.contains("@") {
                usernameIsvalid = true
                setLabel()
            } else {
                usernameIsvalid = false
                setLabel()
            }
        }
    }
    func validatePassword() {
        guard PasswordShhhhh.text != nil else { return }
        if PasswordShhhhh.text!.rangeOfCharacter(from: charset) != nil && PasswordShhhhh.text!.count > 7 {
            passwordIsValid = true
            setLabel()
        } else {
            passwordIsValid = false
            setLabel()
        }
    }
    func setLabel() {
    if passwordIsValid && usernameIsvalid {
        topLabel.text = "Congratulations you've loggin in"
        topLabel.textColor = .white
        topLabel.font.withSize(17)
    } else {
        topLabel.text = "Sorry, the password or username you entered is invalid!!!"
        topLabel.textColor = .systemYellow
    }
}
    
    
    
    
    
    
    
    
    
    
    
}

