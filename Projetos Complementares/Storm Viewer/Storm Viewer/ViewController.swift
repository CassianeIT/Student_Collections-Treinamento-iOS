//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Curitiba on 15/03/21.
//
import UIKit

class ViewController: UIViewController {
     
    override func viewDidLoad() {
       super.viewDidLoad()
        
        // if let está verificando se selectImage é uma String, é apenas para segurança
        if let imageToLoad = selectImage {
            imageOutlet.image = UIImage(named: imageToLoad)
        }
    }
    
    var selectImage: String?
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
   }



