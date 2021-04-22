//
//  BooksTableViewCell.swift
//  My Library
//
//  Created by Curitiba on 22/03/21.
//

import UIKit

class BooksTableViewCell: UITableViewCell {


    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var authorsNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    // Functions
   
    func update (with book: Book) {
        
       //coverImage.image = book.image
        bookNameLabel.text = book.title
        authorsNameLabel.text = book.authors
    }

}
