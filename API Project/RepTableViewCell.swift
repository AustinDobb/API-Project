//
//  RepTableViewCell.swift
//  API Project
//
//  Created by Austin Dobberfuhl on 12/1/23.
//

import UIKit

class RepTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var linkToWebsiteLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with reps: Representatives) {
        nameLabel.text = reps.name
        partyLabel.text = reps.party
        linkToWebsiteLabel.text = reps.link
    }
    
    
}
