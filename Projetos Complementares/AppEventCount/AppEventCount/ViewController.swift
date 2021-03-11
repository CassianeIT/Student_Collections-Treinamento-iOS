//
//  ViewController.swift
//  AppEventCount
//
//  Created by Curitiba on 10/03/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lauchLabel: UILabel!
    @IBOutlet weak var configureLabel: UILabel!
    @IBOutlet weak var willConnectLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var willResignActiveLabel: UILabel!
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    @IBOutlet weak var didEnterBackgroudLabel: UILabel!
    
    var willConnectCount = 0
    var didBecomeActiveCount = 0
    var willResignActiveCount = 0
    var willEnterForegroundCount = 0
    var didEnterBackgroudCount = 0
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    //criamos esta instancia para ter acesso as var criadas em AppDelegate.swift
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }
    
    func updateView() {
        lauchLabel.text = "O app foi carregado \(appDelegate.launchCount) veze(s)"
        configureLabel.text = "A configuração de conexão rodou \(appDelegate.configurationForConnectingCount) veze(s)"
        willConnectLabel.text = "A conexão de cena ocorreu \(willConnectCount) veze(s) "
        didBecomeActiveLabel.text = "A cena foi ativada \(didBecomeActiveCount) veze(s)"
        willResignActiveLabel.text = "A cena entrar em modo resign ocorreu \(willResignActiveCount) veze(s)"
        willEnterForegroundLabel.text = "A cena entrar em Foreground ocorreu \(willResignActiveCount) veze(s)"
        didEnterBackgroudLabel.text = "A cena entrar em Background ocorreu \(didEnterBackgroudCount) veze(s)"
    }
    

}

