import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    var name = ""
    var therapistName = ""
    var password = ""
    
    //sets user defaults for patient name, therapist name, and therapist password
    @IBAction func button(_ sender: Any) {
        if let nametemp = textfield.text{
            if nametemp != ""{
                name = nametemp
                UserDefaults.standard.set(name, forKey: "name")
            }
        }
        if let therapisttemp = textfieldTN.text{
            if therapisttemp != ""{
                therapistName = therapisttemp
                UserDefaults.standard.set(therapistName, forKey: "therapist")
            }
        }
        if let passtemp = textfieldP.text{
            if passtemp != ""{
                password = passtemp
                UserDefaults.standard.set(password, forKey: "password")
            }
        }
    }
    
    @IBOutlet weak var textfieldTN: UITextField!
    @IBOutlet weak var textfieldP: UITextField!
    @IBOutlet weak var textfield: UITextField!
    
    
    //prevents submit button from working if any box is empty
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if textfield.text == "" || textfieldTN.text == "" || textfieldP.text == ""{
            return false
        }
        else{
            return true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //automatically takes user to QuizView if they have logged in before
        if let nam = UserDefaults.standard.string(forKey: "name"){
            print("already logged in")
            print(UserDefaults.standard.string(forKey: "name")!)
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    override func viewDidLoad() {
        UserDefaults.standard.set(0, forKey: "easyCorrect")
        UserDefaults.standard.set(0, forKey: "hardCorrect")
        UserDefaults.standard.set(0, forKey: "easyTotal")
        UserDefaults.standard.set(0, forKey: "hardTotal")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
