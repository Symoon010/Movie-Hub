//
//  NetworkManager.swift
//  Movie Hub
//
//  Created by Symoon Zadid on 24/2/22.
//

import Foundation

class NetworkManager{
    let apiKey = "9b5a564a70b820347a198e1640a05de6"
    //var petitions = [Petition]()
    
//    func fetchNowPlaying(completionHandler: @escaping (Petition?)-> ()){
//        URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=9b5a564a70b820347a198e1640a05de6")!) { data, response, error in
//            if let data = data {
//                do{
//                    let parseJson = try JSONDecoder().decode(Petition.self, from: data)
//                }
//                catch{
//                    print("Error")
//                }
//        }
//        }.resume()
//
//    }
//
    
    func getData(completionHandler: @escaping (Petitions?)-> ())
     {
         let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=9b5a564a70b820347a198e1640a05de6")
         
         URLSession.shared.dataTask(with: url!) { ( data, response, error) in
             if let data = data {
                
                 do{
                     let parseJson = try JSONDecoder().decode(Petitions.self, from: data)
                    
                        //self.petitions = parseJson.results
                     completionHandler(parseJson)
                     
                 }
                 catch
                 {
                     print("Error")
                 }
                 
             }
         }.resume()
         
     }
    
}
