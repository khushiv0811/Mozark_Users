//
//  ViewController.swift
//  Mozark_Users
//
//  Created by khushboo patel on 12/03/21.
//  Copyright © 2021 khushboo patel. All rights reserved.
//

import UIKit

class User_ViewController: UIViewController,UITableViewDataSource , UITableViewDelegate
{
    //MARK:- Properties
    @IBOutlet weak var Table_Users : UITableView!
    
    //MARK:- Variables
    private var arr_Users : [users] = [users]()
    private var selectedindex : Int = -1
    
    //MARK:- App Life cycle 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getdata()
    }
    func getdata()
    {
        NetworkAPIManager.sharedInstance.getAPI(url: APIList.users.users, param: nil, httpMethod: .get, headerParam: nil) { (response, success) in
        print(success)
        if response != nil
        {
            let server_response : NSDictionary = response as! NSDictionary
            let arr_Response : NSArray = server_response["results"] as! NSArray
            print(arr_Response)
            for i in 0 ..< arr_Response.count
            {
                let dict_uservalue : NSDictionary = arr_Response[i] as! NSDictionary
                let UserInfo : users = users()
                UserInfo.Phone = dict_uservalue["phone"] as! String
                UserInfo.Mobile  = dict_uservalue["cell"] as! String
                UserInfo.Email = dict_uservalue["email"] as! String
                UserInfo.Gender = dict_uservalue["gender"] as! String
                
                UserInfo.age = String(((dict_uservalue["dob"] as? [String: Any])?["age"] as? Int)!)
                UserInfo.FirstName = ((dict_uservalue["name"] as? [String: Any])?["first"] as? String)!
                UserInfo.LastName = ((dict_uservalue["name"] as? [String: Any])?["last"] as? String)!
             //   UserInfo.address = String((((dict_uservalue["location"] as? [String: Any])?["street"] as? [String: Any])? ["number"] as? Int)!) + "," + ((((dict_uservalue["location"] as? [String: Any])?["street"] as? [String: Any])? ["name"] as? String)!) + "\n" + String(((dict_uservalue["location"] as? [String: Any])?["postcode"] as? Int)!) + "\n" + ((dict_uservalue["location"] as? [String: Any])?["state"] as? String)! + "\n" + ((dict_uservalue["location"] as? [String: Any])?["country"] as? String)!
                
                self.arr_Users.append(UserInfo)
                
            }
            
            self.Table_Users.reloadData()
        }
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "details_segue"
        {
            let vc = segue.destination as! Details_VC
            vc.user = arr_Users[selectedindex]
            
        }
        
    }
    

    

}

