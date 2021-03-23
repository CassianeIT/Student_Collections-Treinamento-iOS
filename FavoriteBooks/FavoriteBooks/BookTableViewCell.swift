//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Curitiba on 16/03/21.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var authorOutlet: UILabel!
    @IBOutlet weak var genreOutlet: UILabel!
    @IBOutlet weak var lenghtOutlet: UILabel!
    
    
    func update(with book: Book) {
        titleOutlet.text = book.title
        authorOutlet.text = book.author
        genreOutlet.text = book.genre
        lenghtOutlet.text = book.length
    }


}
