//
//  CustomAlert.swift
//  CustomAlert
//
//  Created by Александр Уткин on 25.07.2021.
//

import UIKit

class CustomAlert {
    
    struct Constants {
        static let backgroundAlpha: CGFloat = 0.6
    }
    
    private let backgroudView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        return view
    }()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "border")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var myTargetView: UIView?
    
    func showAlert(title: String, message: String, viewController: UIViewController) {
        
        guard let targetView = viewController.view else { return }
        
        myTargetView = targetView
        
        backgroudView.frame = targetView.bounds
        targetView.addSubview(backgroudView)
        
        alertView.frame = CGRect(x: 40, y: -300, width: targetView.frame.width - 80, height: 300)
        targetView.addSubview(alertView)
        
        backgroundImage.frame = CGRect(x: 0, y: 0, width: alertView.frame.width, height: alertView.frame.height)
        alertView.addSubview(backgroundImage)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 60, width: alertView.frame.width, height: 80))
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .orange
        titleLabel.textAlignment = .center
        alertView.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: 70, y: 60, width: alertView.frame.width - 140, height: 180))
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        alertView.addSubview(messageLabel)
        
        let buttonAlert = UIButton(frame: CGRect(x: 140, y: alertView.frame.height - 120, width: 40, height: 40))
        let okImage = UIImage(named: "ok")?.withRenderingMode(.alwaysOriginal)
        buttonAlert.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        buttonAlert.setImage(okImage, for: .normal)
        alertView.addSubview(buttonAlert)
        
        UIView.animate(withDuration: 0.3) {
            self.backgroudView.alpha = Constants.backgroundAlpha
        } completion: { done  in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.alertView.center = targetView.center
                }
            }
        }
        
    }
    
    @objc func dismissAlert() {
        
        guard let targetView = myTargetView else {
            return
        }
        UIView.animate(withDuration: 0.3) {
            self.alertView.frame = CGRect(x: 40, y: targetView.frame.height, width: targetView.frame.width - 80, height: 300)
        } completion: { done  in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.backgroudView.alpha = 0
                } completion: { done in
                    if done {
                        self.alertView.removeFromSuperview()
                        self.backgroudView.removeFromSuperview()
                        self.backgroudView.removeFromSuperview()
                    }
                }
            }
        }
    }
    
    
}


