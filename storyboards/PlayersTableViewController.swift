//
//  PlayersTableViewController.swift
//  storyboards
//
//  Created by Bamby on 18/8/17.
//  Copyright © 2017 Juan S. Landy. All rights reserved.
//

import UIKit

class PlayersTableViewController: UITableViewController {

    var players = SampleData.generatePlayersData()
    
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

    
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
        
        guard let playerDetailTableViewController = segue.source as? PlayerDetailsTableViewController, let player = playerDetailTableViewController.player else {
            return
        }
        
        players.append(player)
//        self.tableView.reloadData()
        //en lugar de simplemente recargar el tableView, lo hacemos mediante una animación
        let indexPath = IndexPath(row: players.count - 1, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }
}
extension PlayersTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell",for: indexPath) as! PlayerTableViewCell
        
        let player = players[indexPath.row]
        cell.player = player
        return cell
    }
}

