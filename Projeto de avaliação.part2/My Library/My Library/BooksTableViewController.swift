//
//  BooksTableViewController.swift
//  My Library
//
//  Created by Curitiba on 22/03/21.
//
import Foundation
import UIKit

class BooksTableViewController: UITableViewController {
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)

    }

    @IBSegueAction func addEditBook(_ coder: NSCoder, sender: Any?) -> AddEditBookTableViewController? {
            print("add")
            return AddEditBookTableViewController(coder: coder, book: nil)
        }

    @IBAction func unwindTOBookTableView(segue: UIStoryboardSegue) {
            guard segue.identifier == "saveUnwind",
                let sourceViewController = segue.source as? AddEditBookTableViewController,
                let book = sourceViewController.book else {
                return }

                let newIndexPath = IndexPath(row: books.count, section: 0)
                books.append(book)
                print("adicionando")
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
    
    
    var books: [Book] = [] {
        // Toda vez que o array for alterado, o arquivo será salvo.
        didSet {
            Book.saveToFile(books: books)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.leftBarButtonItem = editButtonItem
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 44.0
        
        //Verifica se existe um arquivo de Books salvo
        if let savedBooks = Book.loadFromFile() {
            books = savedBooks
        } else {
            books = Book.bookArray
        }

    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BooksTableViewCell
        
        // define a image mini
        cell.coverImage.image = UIImage(named: books[indexPath.row].image)
        
        let book = books[indexPath.row]
        
        // Step 3: configure cell
        cell.update(with: book)
        cell.showsReorderControl = true
    
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "Cover") as? ImageViewController {
            
            // antes books estava bookArray
            viewController.selectBook = books[indexPath.row].title
            viewController.selectAuthor = books[indexPath.row].authors
            
            viewController.selectImage = books[indexPath.row].image
            navigationController?.pushViewController(viewController, animated: true)
            
        }
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedBook = books.remove(at: fromIndexPath.row)
        books.insert(movedBook, at: to.row)
        print("insert")
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
  

}
