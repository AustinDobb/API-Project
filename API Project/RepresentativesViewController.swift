//
//  RepresentativesViewController.swift
//  API Project
//
//  Created by Austin Dobberfuhl on 12/1/23.
//

import UIKit

class RepresentativesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var repsConatainer = [Representatives]()
    var representativeController = RepsController()
    
    
    @IBOutlet weak var repTableView: UITableView!
    @IBOutlet weak var repSearchBar: UISearchBar!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repsConatainer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reps", for: indexPath) as! RepTableViewCell
        
        let representativesData = repsConatainer[indexPath.row]
        
        cell.update(with: representativesData)

        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repTableView.delegate = self
       
        self.repTableView.dataSource = self
        // Do any additional setup after loading the view.
        
    }
    
    func fetchMatchingRep() {
        
        self.repsConatainer = []
        repTableView.reloadData()
        
        let searchTerm = repSearchBar.text ?? ""
        
        if !searchTerm.isEmpty{
            
            let zipQueryItem = URLQueryItem(name: "zip", value: searchTerm)
            let jsonFormatterQuerryItem = URLQueryItem(name: "output", value: "json")
            
            Task {
                do {
                    let fetchedReps = try await representativeController.fetchRepData(matching: [zipQueryItem, jsonFormatterQuerryItem])
                    self.repsConatainer = fetchedReps
                    repTableView.reloadData()
                } catch {
                    print("Error or something")
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RepresentativesViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingRep()
        searchBar.resignFirstResponder()
    }
}
