//
//  FavoriteTableViewController.swift
//  RedditClient
//
//  Created by Tommy Lam on 8/16/21.
//

import UIKit

class FavoriteTableViewController: UITableViewController {

    let userDefaults = UserDefaults.standard
    let userFavouritesKey = "favorites"
    var userFavourites: [String] = []
    let favouriteManager = FavoriteManager()

    @IBOutlet var favouriteTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userFavourites = self.favouriteManager.retrieveUserFavourites()
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("favourites count : \(userFavourites.count)")
        return userFavourites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell") as! UITableViewCell
        cell.textLabel?.text = userFavourites[indexPath.row]
        return cell
    }
}
