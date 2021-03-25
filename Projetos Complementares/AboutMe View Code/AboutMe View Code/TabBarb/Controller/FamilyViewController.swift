//
//  FamilyViewController.swift
//  AboutMe View Code
//
//  Created by Curitiba on 23/03/21.
//

import UIKit

class FamilyViewController: UIViewController {

//    let imageView: UIImageView = {
//        let someImage = UIImageView(frame: UIScreen.main.bounds)
//        someImage.image = UIImage(named: "fundo")
//        someImage.contentMode = .scaleAspectFill
//      //  someImage.translatesAutoresizingMaskIntoConstraints = false
//       return someImage
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let milkwayimageview = MilkWayImageView(frame: UIScreen.main.bounds)
            view.addSubview(milkwayimageview)
        
        let family = ("Brother: Bruno Freitas, Sister: Ciciane Freitas, Husband: Alan Bancks")
        let headerLabel = HeaderLabelView(fullName: family)
        view.addSubview(headerLabel)
        headerLabel.setConstraints(view: view)
        print("FamilyViewController")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
