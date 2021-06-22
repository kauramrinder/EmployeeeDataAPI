//
//  EmployeeListController.swift
//  EmployeeDataAPI
//
//  Created by user182438 on 11/26/20.
//

import UIKit

class EmployeeListController :UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var list : [ModelEmployee]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        employeeData()
        
    }
    
    
    func employeeData(){
        
        let jsonManager = JSONManager()
        
        jsonManager.fetchJSONData{  (employees) in
            
            DispatchQueue.main.async {
                
                self.list = employees
              
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = "\(list?[indexPath.row].name ?? "")"
        let email = "\(list?[indexPath.row].email ?? "")"
        
        let cell : UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            else {
                return UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
            }
            return cell
        }()
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
        let detailViewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        
        detailViewController?.modelEmployee = (list?[indexPath.row])
        
        self.navigationController?.pushViewController(detailViewController!, animated: true)
    }

}

