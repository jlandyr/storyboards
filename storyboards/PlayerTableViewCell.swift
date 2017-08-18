//
//  PlayerTableViewCell.swift
//  storyboards
//
//  Created by Bamby on 18/8/17.
//  Copyright © 2017 Juan S. Landy. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelGame: UILabel!
    @IBOutlet weak var imageRating: UIImageView!
    
    
    var player: Player? {
        didSet {
            guard let player = player else {return}
            labelName.text = player.name
            labelGame.text = player.game
            imageRating.image = image(forRating: player.rating)
        }
    }
    
    func image(forRating rating: Int) -> UIImage?{
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
