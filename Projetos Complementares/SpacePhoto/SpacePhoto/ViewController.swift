//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Curitiba on 19/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrigthLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    
        title = ""
            imageView.image = UIImage(systemName: "photo.on.rectangle")
            descriptionLabel.text = ""
            copyrigthLabel.text = ""
        
            photoInfoController.fetchPhotoInfo { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let photoInfo):
                        self.updateUI(with: photoInfo)
                    case .failure(let error):
                        self.updateUI(with: error)
                    }
                }
            }
        }
    
        func updateUI(with photoInfo: PhotoInfo) {
            photoInfoController.fetchImage(from: photoInfo.url) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let image):
                        self.title = photoInfo.title
                        self.imageView.image = image
                        self.descriptionLabel.text = photoInfo.description
                        self.copyrigthLabel.text = photoInfo.copyright
                    case .failure(let error):
                        self.updateUI(with: error)
                    }
                }
            }
        }
            func updateUI(with error: Error) {
                title = "Error Fetching Photo"
                imageView.image = UIImage(systemName: "exclamationmark.octagon")
                descriptionLabel.text = error.localizedDescription
                copyrigthLabel.text = ""
            }
        }


