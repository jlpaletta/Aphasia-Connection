//
//  DataView.swift
//  Aphasia Connect
//
//  Created by Lucca Paletta on 10/29/17.
//  Copyright © 2017 jolupa. All rights reserved.
//

import UIKit

class DataView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var Label: UILabel!
    
    
    //Controls segue to beginning screen
    @IBAction func resetButton(_ sender: Any) {
        prepare(for: UIStoryboardSegue.init(identifier: "resetSegue", source: self, destination: ViewController() as UIViewController), sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resetSegue"{
            UserDefaults.standard.set(nil, forKey: "name")
    }
    }
    
    
    // the following three methods all pertain to the tableview in the information ViewController
    var Everything = ["Patient Name: " + UserDefaults.standard.string(forKey: "name")!, "Therapist name: " + UserDefaults.standard.string(forKey: "therapist")!, "Easy questions answered Correctly: " + String(UserDefaults.standard.integer(forKey: "easyCorrect")), "Total easy questions attempted: " + String(UserDefaults.standard.integer(forKey: "easyTotal")), "Hard questions answered correctly: " + String(UserDefaults.standard.integer(forKey: "hardCorrect")), "Total hard questions attempted: " + String(UserDefaults.standard.integer(forKey: "hardTotal"))]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return 6
    }
       
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
    let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
    
        cell.textLabel?.text = Everything[indexPath.row]
    return cell
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
           override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
