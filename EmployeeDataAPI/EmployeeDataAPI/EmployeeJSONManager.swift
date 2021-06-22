//
//  EmployeeJSONManager.swift
//  EmployeeDataAPI
//
//  Created by user182438 on 11/26/20.
//

import Foundation


class JSONManager {


    func fetchJSONData( completionHandler : @escaping ([ModelEmployee])->Void )  {

    
                let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
                  
        
                       let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                         
                           if let error = error {
                            
                               print(error)
                            
                               return
                           }
                          
                           guard let httpResponse = response as? HTTPURLResponse,
                               (200...299).contains(httpResponse.statusCode)
                               else {
                                   
                                   if let httpResponse = response as? HTTPURLResponse {
                                       print("URL: \(httpResponse.url!.path )\nStatus code: \(httpResponse.statusCode)")
                                   }
                                   return
                           }
                           
                          
                               if let data = data {
                               
                               
                               let decoder = JSONDecoder()
                               decoder.dateDecodingStrategy = .iso8601
                        
                               do {
                                
                                   let result = try decoder.decode([ModelEmployee].self, from: data)
                                   
                                completionHandler(result)
                              
                            
                                   
                               }
                               catch {
                                
                                print(error)
                               
                                }
                           }
                       }
                       
                
                       task.resume()
                  
            }
        
    }
