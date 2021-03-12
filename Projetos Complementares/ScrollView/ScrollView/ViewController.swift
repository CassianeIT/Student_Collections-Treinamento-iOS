//
//  ViewController.swift
//  ScrollView
//
//  Created by Curitiba on 11/03/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerForKeyboardNotifications()
        
        // Criar um gesto para dispensar o teclado
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    func registerForKeyboardNotifications() { NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil); NotificationCenter.default.addObserver(self,selector:#selector(keyboardWillBeHidden(_:)), name:UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWasShown(_ notificiation: NSNotification) {
        guard let info = notificiation.userInfo,
              let keyboardFrameValue =
                info[UIResponder.keyboardFrameBeginUserInfoKey]
                as? NSValue else { return }
        
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0,
                                         bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(_ notification:
                                        NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    // Delegate - isso é para quando o usuario clicar em return no app o teclado sumir, para usar é necessário colocar o Protocol UITextFieldDelegate, na class e ai colocar essa funcão abaixo. Por fim ir a storyboard, clicar em textfield e puxar praa bolinha da main e escolher Delegate.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    // My Selectors
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

