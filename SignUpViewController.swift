

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    

    @IBOutlet weak var SignUpButton: UIButton!
    
    
    let userDefaults = UserDefaults()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userConfirmPassword = confirmPasswordTextField.text
        
        // Check for empty fields
        if(userEmail?.isEmpty ?? false || userPassword?.isEmpty ?? false || userConfirmPassword?.isEmpty ?? false)
        {
            // Display alert message
            displayMyAlertMessage("All fields are required")
            return
        }
        
        //Validate against RegEx
        if !(userEmail?.isEmailVaild)!{
            displayMyAlertMessage("Email is invalid. Email format: abc@gmail.com")
        }
        
        if !(userPassword?.isPasswordValid)!{
            displayMyAlertMessage("Minimum password length should be 8, with at least 1 Uppercase letter, 1 Lowercase letter, 1 Number and 1 Special Character")
        }
        
        //Check for password mismatch
        if (userPassword != userConfirmPassword){
            
            displayMyAlertMessage("Passwords do not match")
            return;
        }
        
        // Store data
        userDefaults.set(userEmail, forKey: "userEmail")
        userDefaults.set(userPassword, forKey: "userPassword")
        
        // Display alert message with confirmation.
        alertForLoginButton("Successfully Signed Up!")
    }
    
    
   @IBAction func Btn_Tap(_ sender: Any) {
 let storyboard = UIStoryboard(name: "Main", bundle: nil )
  //let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "navigatetohome") as! LoginViewController
       navigationController?.popViewController(animated: true)
  }
}
