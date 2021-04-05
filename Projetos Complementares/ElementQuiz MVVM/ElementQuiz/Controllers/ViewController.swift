//
//  ViewController.swift
//  ElementQuiz
//
//  Created by Curitiba on 10/02/21.
//

import UIKit

//enum State {
//    case question
//    case answer
//    case score
//}
//
//enum Mode {
//    case flashCard
//    case quiz
//}

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let viewModel = ElementQuizViewModel()

    // DIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
//        mode = .flashCard
//        view.backgroundColor = .white
//
//        showAnswerButton.addTarget(self, action: #selector(showAnswer), for: .touchUpInside)
//        nextButton.addTarget(self, action: #selector(nextAnswer), for: .touchUpInside)
//        modeSelector.addTarget(self, action: #selector(switchModes), for: .valueChanged)
//        self.textField.delegate = self // Habilita para receber o evento do teclado
//
//
//        setupStackView()
        
        viewModel.gameMode.bind { [weak self] gameMode in
            self?.modeSelector.theSegmentedControl = gameMode
        }
        viewModel.icon.bind { [weak self] image in
          self?.currentIcon.image = image
        }
        viewModel.answerLabel.bind { [weak self] answerLabel in
          self?.currentanswerLabel.text = answerLabel
        }
        viewModel.textAnswer.bind { [weak self] textAnswer in
            self?.currenttextAnswer.text = textAnswer
    }
    }
    
    // criando o segmented control
    private let modeSelector: UISegmentedControl = {
        let theSegmentedControl = UISegmentedControl()
        theSegmentedControl.insertSegment(withTitle: "FlashCards", at: 0, animated: true)
        theSegmentedControl.insertSegment(withTitle: "Quiz", at: 1, animated: true)

        return theSegmentedControl

    }()
  
//    // criando a Stack maior
//    private lazy var biggerStack: UIStackView = {
//        let stackView = UIStackView (arrangedSubviews: [modeSelector, imageView, textField, answerLabel, smallerStackView])
//        stackView.distribution = .fill
//        stackView.axis = .vertical
//        stackView.spacing = 20
//        stackView.alignment = .center
//        
//        return stackView
//        
//    }()
    
//    // criando a Stack menor que fica dentro da Stack maior
//    private lazy var smallerStackView: UIStackView = {
//      let stackView = UIStackView(arrangedSubviews:
//        [showAnswerButton, nextButton])
//        stackView.distribution = .fillProportionally
//        stackView.axis = .horizontal
//        stackView.spacing = 30
//        
//      return stackView
//    }()

    // Func com as constraint da stack maior
//    func setupStackView() {
//        view.addSubview(biggerStack)
//        biggerStack.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate (
//            [biggerStack.widthAnchor.constraint(equalToConstant: 370),
//              biggerStack.heightAnchor.constraint(equalToConstant: 430),
//              biggerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//              biggerStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -160) //-130
//            ])
//    }
    
    // Cria uma image view
    let imageView: UIImageView = {
        let viewImage = UIImageView()
        viewImage.contentMode = .scaleAspectFit
        return viewImage
    }()
    
    // Cria um Label
    let answerLabel: UILabel = {
        let labelAnswer = UILabel()
        labelAnswer.text = "AnswerLabel"
        labelAnswer.textColor = .black
        labelAnswer.font = .boldSystemFont(ofSize: 25)
        labelAnswer.numberOfLines = 0
        labelAnswer.textAlignment = .center

        return labelAnswer
        
        
    }()
 
    // Cria um txtfield
    let textField : UITextField = {
        let textAnswer = UITextField()
        textAnswer.text = "?"
        textAnswer.borderStyle = .roundedRect
        textAnswer.minimumFontSize = 17
        textAnswer.translatesAutoresizingMaskIntoConstraints = false
        textAnswer.autocorrectionType = UITextAutocorrectionType.no
        NSLayoutConstraint.activate (
            [
                textAnswer.widthAnchor.constraint(equalToConstant: 144),
            ])
        
        return textAnswer
    }()
    

    private let showAnswerButton = UIButton.createSystemButton(withTitle: "Show Answer")
    private let nextButton = UIButton.createSystemButton(withTitle: "Next Element")
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
     }
    
    
//    // Quiz-specific state
//    var answerIsCorrect = false
//    var correctAnswerCount = 0

//    var mode: Mode = .flashCard {
//        didSet {
//            // Bux Fix
//            switch mode {
//            case .flashCard:
//                setupFlashCards()
//            case .quiz:
//                setupQuiz()
//            
//            }
//            updateUI()
//        }
//    }
//    var state: State = .question
//
//    var elementList = ["Carbon", "Gold", "Chlorine","Sodium"]
//    var currentElementIndex = 0
//    let fixedElementList =
//        ["Carbon", "Gold", "Chlorine","Sodium"]

    // dando erro verificar pg 460
  //  var elementList: [String] = []
//
//    @objc func switchModes(_ sender: Any) {
//        if modeSelector.selectedSegmentIndex == 0 {
//            mode = .flashCard
//        } else {
//            mode = .quiz
//        }
//    }
//
//    // atualiza a UI
//    @objc func showAnswer(_ sender:  UIButton) {
//        state = .answer
//
//        updateUI()
//    }
//
//    //Atualizacao do app
//    @objc func nextAnswer(_ sender:  UIButton) {
//        currentElementIndex += 1
//        if currentElementIndex >= elementList.count {
//            currentElementIndex = 0
//            if mode == .quiz {
//                state = .score
//                updateUI()
//                return
//            }
//        }
//
//        state = .question
//
//        updateUI()
//    }

//    // atualiza a UI do app no modo ficha de estudo
//    func updateFlashCardUI(elementName: String) {
//        // Campo de text e teclado
//        textField.isHidden = true
//        textField.resignFirstResponder()
//
//        //Rótulo de resposta
//        if state == .answer {
//            answerLabel.text = elementName
//        } else {
//            answerLabel.text = "?"
//        }
//        
//        
//        // Controle segmentado
//        modeSelector.selectedSegmentIndex = 0
//
//        // Botões
//        showAnswerButton.isHidden = false
//        nextButton.isEnabled = true
//        nextButton.setTitle("Next Element", for: .normal)
//    }

//    // Atualiza a UI do app no modo teste.
//    func updateQuizUI(elementName: String) {
//        // Controle Segmentado
//        modeSelector.selectedSegmentIndex = 1
//        
//        // Campo de texto e teclado
//        textField.isHidden = false
//        switch state {
//        case .question:
//            textField.isEnabled = true
//            textField.text = ""
//            textField.becomeFirstResponder()
//        case .answer:
//            textField.isEnabled = false
//            textField.resignFirstResponder()
//        case .score:
//            textField.isHidden = true
//            textField.resignFirstResponder()
//        }
//
//            //Rótulo de resposta
//            switch state {
//            case .question:
//                answerLabel.text = ""
//            case .answer:
//                if answerIsCorrect {
//                    answerLabel.text = "Correct!"
//                } else {
//                    answerLabel.text = "❌ \nResposta correta: " + elementName
//                }
//            case .score:
//                answerLabel.text = ""
//                print("Your score is \(correctAnswerCount) out of \(elementList.count).")
//            }
//          
//            if state == .score {
//                displayScoreAlert()
//            }
//
//        
//        // Botões
//        showAnswerButton.isHidden = true
//        if currentElementIndex == elementList.count - 1 {
//            nextButton.setTitle("Show Score", for: .normal)
//        } else {
//            nextButton.setTitle("Next Question", for: .normal)
//        }
//        switch state {
//        case .question:
//            nextButton.isEnabled = false
//        case .answer:
//            nextButton.isEnabled = true
//        case .score:
//            nextButton.isEnabled = false
//        }
//    }



//    // Atualiza a UI do app com base no seu modo e estado.
//    func updateUI() {
//        // Código cmpartilhado: atualização de imagem
//        let elementName = elementList[currentElementIndex]
//        let image = UIImage(named: elementName)
//        imageView.image = image
//
//        // As atualizações de ui de um modo específico se dividem em dois
//        // métodos para faciliar a leitura
//        switch mode {
//        case .flashCard:
//            updateFlashCardUI(elementName: elementName)
//        case .quiz:
//            updateQuizUI(elementName: elementName)
//        }
//    }

    
//    // Executa após o usuário pressionar a tecla Return no teclado - tirei do parametro _ textField: UITextField
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // Pega o texto do campo de texto
//        
//        let textFieldContents = textField.text!
//        textField.resignFirstResponder()
//
//        // Determina se o usuário respondeu corretamente e atualiza o estado de teste
//        if textFieldContents.lowercased() ==
//            elementList[currentElementIndex].lowercased () {
//            answerIsCorrect = true
//            correctAnswerCount += 1
//        } else {
//            answerIsCorrect = false
//        }
//        if answerIsCorrect {
//            print("Correct!")
//        } else {
//            print("❌")
//        }
//
//        // O aplicativo agora deve mostrar a resposta ao usuário
//        state = .answer
//
//        updateUI()
//
//        return true
//    }

//    // Shows an iOS alert with the user's quiz score.
//    func displayScoreAlert() {
//        let alert = UIAlertController(title: "Quiz Score", message: "Your score is \(correctAnswerCount) out of \(elementList.count).", preferredStyle: .alert)
//
//        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: scoreAlertDismissed(_:))
//        alert.addAction(dismissAction)
//
//        present(alert, animated: true, completion: nil)
//    }
//
//    func scoreAlertDismissed(_ action: UIAlertAction) {
//        mode = .flashCard
//    }
//
//    // Abre uma nova sessão da ficha de estudo.
//    func setupFlashCards() {
//        state = .question
//        currentElementIndex = 0
//
//        elementList = fixedElementList
//    }
//
//    // Abre um novo teste.
//    func setupQuiz() {
//        state = .question
//        currentElementIndex = 0
//        answerIsCorrect = false
//        correctAnswerCount = 0
//
//        elementList = fixedElementList.shuffled()
//    }

}


private extension UIButton {
  static func createSystemButton(withTitle title: String) -> UIButton {
      let button = UIButton(type: .system)
      button.setTitle(title, for: .normal)
      return button
  }
}
    



