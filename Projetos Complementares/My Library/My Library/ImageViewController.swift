//
//  ImageViewController.swift
//  My Library
//
//  Created by Curitiba on 22/03/21.
//

import Foundation
import UIKit


import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     
    override func viewDidLoad() {
       super.viewDidLoad()
    
        borda()
        
        if let imageToLoad = selectImage {
            coverOutlet.image = UIImage(named: imageToLoad)
            bookName.text = selectBook
            authorsName.text = selectAuthor
        }
        
   }
    
    var selectAuthor: String?
    var selectBook: String?
    var selectImage: String? 
    
   // Segunda tela 2 labels e 1 imageView
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var authorsName: UILabel!
    @IBOutlet weak var coverOutlet: UIImageView!
    
    
    
    @IBAction func updateButton(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)

     // Inclui ação de Câmera apenas se o device tiver esse recurso
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in imagePicker.sourceType = .camera; self.present(imagePicker, animated: true, completion: nil)
        })
        
        alertController.addAction(cameraAction)
        }
        // Inclui ação de Biblioteca de Fotos apenas se o device tiver esse recurso
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library",
                                                   style: .default, handler: { action in
                                                    imagePicker.sourceType = .photoLibrary
                                                    self.present(imagePicker, animated: true, completion: nil)
                                                   })
            alertController.addAction(photoLibraryAction)
        }
        alertController.popoverPresentationController?.sourceView =
            sender
        present(alertController, animated: true, completion: nil)
        
    }
    

    // MARK: - Funções
    func borda () {
        coverOutlet.layer.cornerRadius = 15

    }
    
    // MARK: - delegates
    
    // Delegate para a ImagePickerController infomrar (delegar) a açaão do usuario
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // troca a imagemView te permite escolher na biblioteca
        guard let selectedImage = info[.originalImage] as?
               UIImage else { return }
        
            coverOutlet.image = selectedImage
            dismiss(animated: true, completion: nil)
    }
}

