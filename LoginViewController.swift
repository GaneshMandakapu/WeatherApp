

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var SignButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    let userDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        loginButton.layer.cornerRadius = 20
        SignButton.layer.cornerRadius = 20
        self.userEmail?.text = nil
        self.userPassword?.text = nil
        
//    let storyboard = UIStoryboard(name: "Main", bundle: nil )
//       let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        navigationController?.pushViewController(HomeVC, animated: true)

    }
    
//login
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        
        
        
        let userEmail = userEmail.text
        let userPassword = userPassword.text
    
        //Retrieving UserDefaults values
        let userEmailStored = userDefaults.value(forKey: "userEmail") as? String ?? ""
        let userPasswordStored = userDefaults.value(forKey: "userPassword") as? String ?? ""
        print("userEmail")
        print("userPassword")
        
        //E-mail & Password Validation
        if !(userEmail?.isEmpty ?? false) && !(userPassword?.isEmpty ?? false){
            
            if userEmail == userEmailStored {
                
                if userPassword == userPasswordStored {
                    
                    //self.performSegue(withIdentifier: "NavigateToData", sender: nil)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil )
                       let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        navigationController?.pushViewController(HomeVC, animated: true)

                }else{
                    displayMyAlertMessage("Password Incorrect!")
                }
            }else{
                displayMyAlertMessage("Incorrect Email-id")
            }
        }else{
            displayMyAlertMessage("All Fields Required")
        }
    }
    
    
    @IBAction func SignUpClicked(_ sender: Any) {
     //self.performSegue(withIdentifier: "NavigateToSignUp", sender: nil)
        //let Storyboard = UIStoryboard(name: "Main", bundle: nil )
          let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        navigationController?.pushViewController(HomeVC, animated: true)
        
}
}

