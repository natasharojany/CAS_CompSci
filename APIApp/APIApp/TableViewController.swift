//
//  TableViewController.swift
//  APIApp
//
//  Created by Lance Davenport on 12/19/19.
//  Copyright © 2019 Lance Davenport. All rights reserved.
//

//
//  TableViewController.swift
//  anotherSWAPIapp
//
//  Created by Lance Davenport on 12/19/19.
//  Copyright © 2019 Lance Davenport. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController {
    
    struct Game : Decodable {
        let name : String?
        let URL : URL
    }
    // name is an array
    func parseRandom() {
        let number = Int.random(in: 0 ..< 71002)
        let url: URL = URL(string:     "https://www.giantbomb.com/api/game/3030-\(number)/?api_key=5094689370c2cf4ae42a2a268af0595badb1fea8&format=json&field_list=genres,name")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let result: String? = dictionary["result"] as? String
                    if let result = result {
                        let name: String? = result["name"] as? String
                    }
                }
            }
        }
    }
    
    var games = [Game]()
    
    func parseGames() {
        let number = Int.random(in: 0 ..< 71002)
        let url: URL = URL(string:     "https://www.giantbomb.com/api/game/3030-\(number)/?api_key=5094689370c2cf4ae42a2a268af0595badb1fea8&format=json&field_list=genres,name")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let result: String? = dictionary["result"] as? String
                    if let result = result {
                        let name: String? = dictionary["name"] as? String
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseGames()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return games.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let allGame = games[indexPath.row].name
        cell.textLabel!.text = allGame
        return cell
    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
   /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as! ViewController
        // Pass the selected object to the new view controller.
        let indexPath = self.tableView.indexPathForSelectedRow
        let b = self.games[indexPath!.row]
        vc.gameRandom = b
    }
    
    
    */
}
