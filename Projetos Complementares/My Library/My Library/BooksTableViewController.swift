//
//  BooksTableViewController.swift
//  My Library
//
//  Created by Curitiba on 22/03/21.
//
import Foundation
import UIKit

class BooksTableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Array Books
  
    var bookArray: [Book] {
        return [
            Book(image: "A Guide to Tea", title: "A Guide to Tea", authors: "Adagio Teas"),
            Book(image: "Blasting for Health", title: "Blasting Optimum for Health Recipe Book", authors: "NutriBullet"),
            Book(image: "Bosch", title: "Bosch", authors: "Laurinda Dixon"),
            Book(image: "Date to Lead", title: "Date to Lead", authors: "Brené Brown"),
            Book(image: "Doodle All Year", title: "Doodle All Year", authors: "Taro Gomi"),
            Book(image: "Drawing People", title: "Drawing People", authors: "Barbara Bradley"),
            Book(image: "Drinking Saints", title: "Drinking  with the Saints", authors: "Michael P. Foley"),
            Book(image:  "Ein Neues Land", title: "Ein Neues Land", authors: "Shaun Tan"),
            Book(image: "Goya", title: "The Life and Complete Work Francisco Goya", authors: "P. Gassier & J Wilson"),
            Book(image: "How to Draw Cats", title: "How to Draw Cats", authors: "Janet Rancan"),
            Book(image: "Pressed Fairy Book", title: "Lady Cottington's Pressed Fairy Book", authors: "Lady Cottington"),
            Book(image: "What to Say", title: "What to Say When You Talk to Yourself", authors: "Shad Helmstetter")
        ]
        
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BooksTableViewCell
        
        
        cell.coverImage.image = UIImage(named: bookArray[indexPath.row].image)
        cell.bookNameLabel.text = bookArray[indexPath.row].title
        cell.authorsNameLabel.text = bookArray[indexPath.row].authors
        

    
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "Cover") as? ImageViewController {
            
            viewController.selectBook = bookArray[indexPath.row].title
            viewController.selectAuthor = bookArray[indexPath.row].authors
            
            viewController.selectImage = bookArray[indexPath.row].image
            navigationController?.pushViewController(viewController, animated: true)
            
        }
    }


  

}
