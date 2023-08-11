//
//  ViewController.swift
//  passingData
//
//  Created by mjeed on 10/08/2023.
//

import UIKit

class FristVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var genderLable: UILabel!
    @IBOutlet weak var cuntryLable: UILabel!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - View Life Cycle
        getDataUser()

        
        
    }
    // MARK: -  Configure Action - Func
    
    func getDataUser() {
        let name = UserDefaults.standard.string(forKey: "name") ?? ""
        let email = UserDefaults.standard.string(forKey: "email") ?? ""
        let gender = UserDefaults.standard.string(forKey: "gender") ?? ""
        let cuntry = UserDefaults.standard.string(forKey: "cuntry") ?? ""
        print("Your name\(name) , your email\(email) ,your gender\(gender) , your country \(cuntry)")
        
        // عرض البيانات داخل الـ Labels
        nameLable.text = "Name: \(name)"
        emailLable.text = "Email: \(email)"
        genderLable.text = "Gender: \(gender)"
        cuntryLable.text = "Country: \(cuntry)"

    }

    @IBAction func updateProfileButton(_ sender: UIButton) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else {return}
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        vc.userdata = self
        present(vc, animated: true)
    }
    
}

extension FristVC : Profile {
    /// protocol get data from SecondVC
    func passDataProfile(name: String, email: String, gender: String, cuntry: String) {
        
        nameLable.text = name
        emailLable.text = email
        genderLable.text = gender
        cuntryLable.text = cuntry
        
        
    }

}

