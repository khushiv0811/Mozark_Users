//
//  Details_VC.swift
//  Mozark_Users
//
//  Created by khushboo patel on 12/03/21.
//  Copyright © 2021 khushboo patel. All rights reserved.
//

import UIKit
import CoreData

class Details_VC: UIViewController
{
    //MARK:- IBOutlets
    @IBOutlet weak var label_FirstName : UILabel!
    @IBOutlet weak var label_LastName : UILabel!
    @IBOutlet weak var label_Gender : UILabel!
    @IBOutlet weak var label_Email : UILabel!
    @IBOutlet weak var label_Phone : UILabel!
    @IBOutlet weak var label_Mobile : UILabel!
    @IBOutlet weak var label_age : UILabel!
    @IBOutlet weak var label_address : UILabel!
    
    
    //MARK:- Variables
    var user : users = users()
    
   
    let appDelegate = UIApplication.shared.delegate as! AppDelegate //Singlton instance
    var context:NSManagedObjectContext!
    //MARK:- App Life Cycle

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupui()
    }
    
    //MARK:- Setup UI
    func setupui()
    {
        label_FirstName.text = "FirstName : " + user.FirstName
        label_LastName.text = "LastName : " + user.LastName
        label_Gender.text = "Gender : " + user.Gender
        label_age.text = "Age : " + user.age
        label_Email.text =  user.Email
        label_Phone.text = "Phone : " + user.Phone
        label_Mobile.text = "CellPhone : " + user.Mobile
    //    label_address.text = "Address : " + user.address

    }
    
    // MARK: Methods to Open andStore  data
    func openDatabse(_ sender : UIButton)
    {
        context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User_CModel", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        saveData(UserDBObj:newUser, sender)
    }

    func saveData(UserDBObj:NSManagedObject ,_ sender : UIButton)
    {
        UserDBObj.setValue(user.FirstName, forKey: "firstname")
        UserDBObj.setValue(user.LastName, forKey: "lastname")
        UserDBObj.setValue(user.Gender, forKey: "gender")
        UserDBObj.setValue(user.age, forKey: "age")
        UserDBObj.setValue(user.Email, forKey: "email")
        UserDBObj.setValue(user.Phone, forKey: "phonenumber")
         UserDBObj.setValue(user.Mobile, forKey: "cell")

        print("Storing Data..")
        do
        {
            try context.save()
            sender.isUserInteractionEnabled = false
            sender.alpha = 0.5
            sender.setTitle("Data Saved", for: .normal)
            
        }
        catch
        {
            print("Storing data Failed")
        }

      //  fetchData()
    }
    
    //MARK:- IBAction
    
    @IBAction func onclick_save(_ sender : UIButton)
    {
        openDatabse(sender)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
