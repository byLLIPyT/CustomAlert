//
//  ViewController.swift
//  CustomAlert
//
//  Created by Александр Уткин on 25.07.2021.
//

import UIKit

class ViewController: UIViewController {

    let myButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        button.setTitle("Show alert", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let alert = CustomAlert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        view.backgroundColor = .white
        myButton.addTarget(self, action: #selector(myButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func myButtonTapped() {
        alert.showAlert(title: "LIKE", message: "Press button", viewController: self)
    }

}

extension ViewController {
    
    func setConstraints() {
        view.addSubview(myButton)
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.heightAnchor.constraint(equalToConstant: 60),
            myButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

