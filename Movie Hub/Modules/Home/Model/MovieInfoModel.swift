//
//  MovieInfoModel.swift
//  Movie Hub
//
//  Created by Symoon Zadid on 26/2/22.
//

import Foundation



struct Petitions: Codable {
    
    var results: [Petition]
}
 
struct Petition: Codable {
    var adult : Bool
    var backdrop_path : String
    var original_language : String
    var original_title : String
    var poster_path : String?
    var fullPosterPath: String? {
        guard let path = poster_path else { return nil}
        return  "https://image.tmdb.org/t/p/w185/\(path)"
    }
}

