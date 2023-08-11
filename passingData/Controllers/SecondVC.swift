//
//  SecondVC.swift
//  passingData
//
//  Created by mjeed on 10/08/2023.
//

import UIKit

protocol Profile {
    func passDataProfile(name:String , email:String , gender:String , cuntry: String)
}

class SecondVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var cuntryTextField: UITextField!

    var userdata:Profile?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - View Life Cycle
        
        
    }
    
    // MARK: -  Configure Action - Func

    @IBAction func updatePressBution(_ sender: UIButton) {
        
        userdata?.passDataProfile(name: nameTextField.text!, email: emailTextField.text!, gender: genderTextField.text!, cuntry: cuntryTextField.text!)
        
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(emailTextField.text, forKey: "email")
        UserDefaults.standard.set(genderTextField.text, forKey: "gender")
        UserDefaults.standard.set(cuntryTextField.text, forKey: "cuntry")
        
        dismiss(animated: true)
    }
    

}

extension SecondVC {
    
}
