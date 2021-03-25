//
//  HobbiesViewController.swift
//  AboutMe View Code
//
//  Created by Curitiba on 23/03/21.
//

import UIKit

class HobbiesViewController: UIViewController {

//    let imageView: UIImageView = {
//        let someImage = UIImageView(frame: UIScreen.main.bounds)
//        someImage.image = UIImage(named: "fundo")
//        someImage.contentMode = .scaleAspectFill
      //  someImage.translatesAutoresizingMaskIntoConstraints = false
//       return someImage
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.addSubview(imageView)

        let milkwayimageview = MilkWayImageView(frame: UIScreen.main.bounds)
            view.addSubview(milkwayimageview)
        
        let hobbies = ("Watch TV, Read, Play Video game")
        let headerLabel = HeaderLabelView(fullName: hobbies)
        view.addSubview(headerLabel)
        headerLabel.setConstraints(view: view)
        print("HobbiesViewController")
        
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


