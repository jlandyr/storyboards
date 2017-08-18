//
//  PlayerDetailsTableViewController.swift
//  storyboards
//
//  Created by Bamby on 18/8/17.
//  Copyright © 2017 Juan S. Landy. All rights reserved.
//

import UIKit

class PlayerDetailsTableViewController: UITableViewController {

    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var labelDetail: UILabel!
    
    var player: Player?
    
    var game:String = "Chess" {
        didSet {
            labelDetail.text = game
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePlayerDetail", let playerName = self.textName.text {
            player = Player(name: playerName, game: game, rating: 1)
        }
        if segue.identifier == "PickGame", let gamePickerTableViewController = segue.destination as? GamePickerTableViewController{
            //enviamos a GamePickerTableViewController el game seleccionado, esa vista se encarga de seleccionarlo en el tableView
            
            gamePickerTableViewController.selectedGame = game
        }
    }

}
extension PlayerDetailsTableViewController{
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            self.textName.becomeFirstResponder()
        }
    }
    
    @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue) {
        if let gamePickerViewController = segue.source as? GamePickerTableViewController,
            let selectedGame = gamePickerViewController.selectedGame {
            game = selectedGame
        }
    }
}
