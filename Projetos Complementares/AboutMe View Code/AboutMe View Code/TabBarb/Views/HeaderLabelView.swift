//
//  HeaderLabelView.swift
//  AboutMe View Code
//
//  Created by Curitiba on 24/03/21.
//

import Foundation
import UIKit

class HeaderLabelView: UILabel {
    // 1
    override var text: String? {
      didSet {
        guard let words = text?
          .components(separatedBy: ", ")
          else { return }
        let joinedWords = words.joined(separator: "\n")
        guard text != joinedWords else { return }
        DispatchQueue.main.async { [weak self] in
          self?.text = joinedWords
        }
      }
    }

    // 2
    init(fullName: String? = "Full Name") {
      super.init(frame: .zero)
      setTextAttributes()
      text = fullName
    }

    // 3
    required init?(coder: NSCoder) {
      super.init(coder: coder)
    }

    // 4
    private func setTextAttributes() {
    textColor = .yellow
      numberOfLines = 0
      textAlignment = .center
      font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    func setConstraints(view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([self.centerXAnchor.constraint(equalTo: view.centerXAnchor), self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
      }

}

