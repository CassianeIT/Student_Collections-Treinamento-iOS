//
//  MilkWayImageView.swift
//  AboutMe View Code
//
//  Created by Curitiba on 23/03/21.
//

import UIKit

class MilkWayImageView: UIImageView {
       
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
        
    func createSubviews() {
        // all the layout code from above
        self.contentMode = .scaleAspectFill
        self.image = UIImage(named: "fundo")
    }
}
