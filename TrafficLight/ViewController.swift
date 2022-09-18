//
//  ViewController.swift
//  TrafficLight
//
//  Created by hiirari on 17.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    enum CurrentLightState {
        case off, red, yellow, green
    }
    
    var currentLightState: CurrentLightState = .off {
        didSet {
            switch currentLightState {
            case .off:
                redLight.alpha = 0.3
                yellowLight.alpha = 0.3
                greenLight.alpha = 0.3
                changeColourButton.setTitle("START", for: .normal)
            case .red:
                redLight.alpha = 1
                yellowLight.alpha = 0.3
                greenLight.alpha = 0.3
                
            case .yellow:
                yellowLight.alpha = 1
                greenLight.alpha = 0.3
                redLight.alpha = 0.3
            case .green:
                greenLight.alpha = 1
                redLight.alpha = 0.3
                yellowLight.alpha = 0.3
            }
        }
    }
    
    @IBOutlet var changeColourButton: UIButton!
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColourButton.layer.cornerRadius = 20
        currentLightState = .off
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "kaworu")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        viewDidLayoutSubview()
    }
    
    func viewDidLayoutSubview() {
        redLight.layer.cornerRadius = redLight.frame.height / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.height / 2
        greenLight.layer.cornerRadius = greenLight.frame.height / 2
    }
   

    @IBAction func changeColourButtonTapped(sender: UIButton) {
        changeColourButton.setTitle("NEXT", for: .normal)
        switch currentLightState {
        case .off:
            currentLightState = .red
        case .red:
            currentLightState = .yellow
        case .yellow:
            currentLightState = .green
        case .green:
            currentLightState = .off
        }

    }
    
    }
    


