//
//  Localusers_VC.swift
//  Mozark_Users
//
//  Created by khushboo patel on 15/03/21.
//  Copyright © 2021 khushboo patel. All rights reserved.
//

import UIKit
import CoreData

class Localusers_VC: UIViewController , UITableViewDelegate , UITableViewDataSource {

    //MARK:- Properties
    @IBOutlet weak var Table_Users : UITableView!
    
    //MARK:- Variables
    private var arr_Users : [users] = [users]()
    private var selectedindex : Int = -1
    let appDelegate = UIApplication.shared.delegate as! AppDelegate //Singlton instance
    var context:NSManagedObjectContext!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    //MARK:- Fetch data
    
    
        

    func fetchData()
    {
        context = appDelegate.persistentContainer.viewContext
         
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User_CModel")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                 let UserInfo : users = users()
                UserInfo.FirstName = data.value(forKey: "firstname") as! String
                UserInfo.LastName = data.value(forKey: "lastname") as! String
                UserInfo.Phone = data.value(forKey: "phonenumber") as! String
                UserInfo.Mobile  = data.value(forKey: "cell") as! String
                UserInfo.Email = data.value(forKey: "email") as! String
                UserInfo.Gender = data.value(forKey: "gender") as! String
                               
                UserInfo.age = data.value(forKey: "age") as! String
                arr_Users.append(UserInfo)
            }
            self.Table_Users.reloadData()
        } catch
        {
            print("Fetching data Failed")
        }
    }
    //MARK:- Table view data source
       
       
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
       {
           return arr_Users.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
       {
           let cell = tableView.dequeueReusableCell(withIdentifier: "user_TVC", for: indexPath) as! user_TVC
           
           cell.label_Name.text = arr_Users[indexPath.row].FirstName + " " + arr_Users[indexPath.row].LastName
           cell.label_Gender.text = arr_Users[indexPath.row].Gender
           cell.label_Age.text = arr_Users[indexPath.row].age + " Years"
           
           return cell
       }
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
       {
           selectedindex = indexPath.row
           self.performSegue(withIdentifier: "details_segue", sender: self)
       }

 
    // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "details_segue"
        {
            let vc = segue.destination as! Details_VC
            vc.user = arr_Users[selectedindex]
            
        }
        
    }

}
