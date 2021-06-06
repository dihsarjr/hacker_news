//
//  NetworkManager.swift
//  HACKER NEWS
//
//  Created by Rashid on 06/06/21.
//

import Foundation

class NetworkMannager: ObservableObject {
   @Published var posts = [Post]()
    func fetchData() {
        if  let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decord = JSONDecoder()
                    if let safeData = data{
                        do{
                          let results =  try decord.decode(Results.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                         
                        }catch{
                            print(error)
                        }
                    
                    }
                    
                }
            }
            task.resume()
        }
    }
}
