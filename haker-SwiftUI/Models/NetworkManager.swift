//
//  NetworkManager.swift
//  haker-SwiftUI
//
//  Created by asmaa gamal  on 05/06/2024.
//

import Foundation
class NetworkManager:ObservableObject{
    @Published var posts:[HitModel] = []
    init(){
        fetchData()
    }
    func fetchData(){
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        request.cachePolicy = .useProtocolCachePolicy
        
        let task = URLSession.shared.dataTask(with:request ){data,response,error in
            if let jsonData = data{
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(PostModel.self, from: jsonData)
                    DispatchQueue.main.async{
                        self.posts = result.hits
                    }
                }catch{
                    print(error)
                }
                
            }
            
        }
        task.resume()
    }
    
}
