//
//  AddEditBookTableViewController.swift
//  My Library
//
//  Created by Curitiba on 05/04/21.
//

import UIKit
import Photos

class AddEditBookTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func buttonAddImage(_ sender: UIButton) {
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
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in imagePicker.sourceType = .photoLibrary
       self.present(imagePicker, animated: true, completion: nil)
        })
            alertController.addAction(photoLibraryAction)
        }
        alertController.popoverPresentationController?.sourceView =
            sender
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func textEditingChaged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    
    var book: Book?
    
    init?(coder: NSCoder, book: Book?) {
        self.book = book
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        if let book = book {
//            titleTextField.text = book.title
//            authorTextField.text = book.authors
//            title = "Edit Book"
//        } else {
//            title = "Add Book"
//        }
        
        updateSaveButtonState()
        borda()
    }
    
    // MARK: - Functions
    func updateSaveButtonState() {
        let titleText = titleTextField.text ?? ""
        let authorText = authorTextField.text ?? ""
        saveButton.isEnabled = !titleText.isEmpty && !authorText.isEmpty
        
        borda()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("inicio")
        
        guard segue.identifier == "saveUnwind" else { return }
        
        
        let image = "Bosch"
        print(image) 
        let title = titleTextField.text ?? ""
        let author = authorTextField.text ?? ""
        book = Book(image: image, title: title,
                    authors: author)
        print("segue")
        borda()
    }

    // MARK: - Funções
    func borda () {
        bookImageView.layer.cornerRadius = 15

    }
    
    // MARK: - delegates
    
    // Delegate para a ImagePickerController infomrar (delegar) a açaão do usuario
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // troca a imagemView te permite escolher na biblioteca
        guard let selectedImage = info[.originalImage] as?
               UIImage
        
            else { return }
            bookImageView.image = selectedImage
            dismiss(animated: true, completion: nil)
    }
    

}
