//
//  DetailViewController.swift
//  EmployeeDataAPI
//
//  Created by user182438 on 11/26/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var txtName: UILabel!
    @IBOutlet var txtEmail: UILabel!
    @IBOutlet var txtPhone: UILabel!
    @IBOutlet var txtUsername: UILabel!
    @IBOutlet var txtAddress: UILabel!
    @IBOutlet var txtCompany: UILabel!
    @IBOutlet var txtWebsite: UILabel!
    @IBOutlet weak var txtPhrase: UILabel!
    
    var modelEmployee : ModelEmployee?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output(model: modelEmployee!)
        txtWebsite.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.tapFunction))
        
        txtPhone.isUserInteractionEnabled = true
        txtPhone.addGestureRecognizer(tap)
    }
    
    
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
            
        }
    
    func output(model : ModelEmployee) {
      
        txtName?.text = model.name
        txtEmail?.text = model.email
        txtPhone?.text = model.phone
        txtUsername?.text = model.username
        
        txtAddress?.text = "\(model.address.suite) \(model.address.street) \(model.address.city) \(model.address.zipcode)"
        
        
        txtCompany.text = " Name: \(model.company.name)"
        
        txtPhrase.text = "Phrase: \(model.company.catchPhrase)"
        
        txtWebsite.text = "\(model.website)"
        
        
        websiteLink(urlStr: model.website)
    }
    
    
    func websiteLink(urlStr:String!) {

         if let url = NSURL(string:urlStr) {
            
            UIApplication.shared.open(url as URL)
            
    }
        
    }

}
