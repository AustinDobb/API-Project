//
//  DogViewController.swift
//  API Project
//
//  Created by Austin Dobberfuhl on 12/1/23.
//

import UIKit

class DogViewController: UIViewController {
    
    
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var dogNewImageButton: UIButton!
    
    let doggoController = DoggoController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }
    
    @IBAction func NewImageButtonTapped(_ sender: Any) {
        dogImageView.image = nil
        Task {
            do {
                let dog = try await doggoController.fetchRandomDoggo()
                print(dog)
                let imageData = try await doggoController.fetchImageData(for: dog.imageURL )
                print(dog.imageURL)
                print(String(data: imageData, encoding: .utf8))
                dogImageView.image = UIImage(data: imageData)
            }
            
        }
        
        
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


