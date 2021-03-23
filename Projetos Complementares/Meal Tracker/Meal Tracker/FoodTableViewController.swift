//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Curitiba on 15/03/21.
//

import UIKit

class FoodTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    // MARK: - Table view data source
    var meals: [Meal] {
        var breakfast = Meal(name: "breakfast", food: [breakfastbread, breakfastegg, breakfastcoffe])
        var lunch = Meal(name: "lunch", food: [luchrice, luchbeans, luchbiffe, luchsalad])
        var dinner = Meal(name: "dinner", food: [dinnersoup, dinnertoast, dinnergrated])
        return [breakfast, lunch, dinner]
    }
    
    var breakfastbread = Food(name: "Pão Integral", description: "Com manteiga")
    var breakfastegg = Food(name: "Ovos", description: "Mexidos")
    var breakfastcoffe = Food(name: "Café", description: "com adoçante")
    var luchrice = Food(name: "Arroz", description: "cozido")
    var luchbeans = Food(name: "Feijão", description: "cozido")
    var luchbiffe = Food(name: "Biffe", description: "frito")
    var luchsalad = Food(name: "Salada", description: "de alface")
    var dinnersoup = Food(name: "Sopa", description: "de legumes com carne")
    var dinnertoast = Food(name: "Torrada", description: "integral")
    var dinnergrated = Food(name: "Queijo", description: "ralado")


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)

        cell.textLabel?.text = "\(meals[indexPath.section].food[indexPath.row].name)"
        cell.detailTextLabel?.text = "\(meals[indexPath.section].food[indexPath.row].description)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
