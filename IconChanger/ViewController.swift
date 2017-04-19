//
//  ViewController.swift
//  IconChanger
//
//  Created by Adam Bezák on 19.4.17.
//  Copyright © 2017 Adam Bezák. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let changeButtonView: UIButton = {
        let changeButton = UIButton()
        changeButton.setTitle("Change", for: .normal)
        changeButton.backgroundColor = UIColor.gray
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        changeButton.addTarget(self, action: #selector(handleChangeButton), for: .touchUpInside)
        return changeButton
    }()
    
    func handleChangeButton() {
        guard UIApplication.shared.supportsAlternateIcons else {
            return
        }
        
        if UIApplication.shared.alternateIconName == "Aicon" {
            UIApplication.shared.setAlternateIconName("Bicon"){ error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
        else {
            UIApplication.shared.setAlternateIconName("Aicon"){ error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(changeButtonView)
        
        //ios10 contrains x,y,width, height
        
        changeButtonView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        changeButtonView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        changeButtonView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        changeButtonView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

