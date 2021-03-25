//
//  BioViewController.swift
//  AboutMe View Code
//
//  Created by Curitiba on 23/03/21.
//

import UIKit


class BioViewController: UIViewController {

//    let imageView: UIImageView = {
//        let someImage = UIImageView(frame: UIScreen.main.bounds)
//        someImage.image = UIImage(named: "fundo")
//        someImage.contentMode = .scaleAspectFill
//      //  someImage.translatesAutoresizingMaskIntoConstraints = false
//       return someImage
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   imageViewSetupConstraints()

        let milkwayimageview = MilkWayImageView(frame: UIScreen.main.bounds)
            view.addSubview(milkwayimageview)

        let bio = ("Name: Cassiane Freitas, Occupation: Developer, Hometown: Curitiba")
        let headerLabel = HeaderLabelView(fullName: bio)
        view.addSubview(headerLabel)
        headerLabel.setConstraints(view: view)
        print("BioViewController")
      //  self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fundo")!)
    }
    
//
//    // MARK: - Contrains Image
//    func imageViewSetupConstraints() {
//        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 600).isActive = true
//
//
//
//    }

}
