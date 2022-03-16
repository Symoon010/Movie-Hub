//
//  HomeViewController.swift
//  Movie Hub
//
//  Created by Symoon Zadid on 10/2/22.
//

import UIKit

class HomeViewController: UIViewController {
    var petitions = [Petition]()
    @IBOutlet weak var movie: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       //getData()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func getData()
     {
         let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=9b5a564a70b820347a198e1640a05de6")
         
         URLSession.shared.dataTask(with: url!) { ( data, response, error) in
             if let data = data {
                
                 do{
                     let parseJson = try JSONDecoder().decode(Petitions.self, from: data)
                        self.petitions = parseJson.results
                     
                 }
                 catch
                 {
                     print("Error")
                 }
                 
             }
         }.resume()
         
     }
    


}
extension HomeViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! MovieCategoryTableViewCell
        return cell
    }
    
}

