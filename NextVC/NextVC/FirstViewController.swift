//
//  FirstViewController.swift
//  NextVC
//
//  Created by KIM Hyung Jun on 2023/07/03.
//

import UIKit

class FirstViewController: UIViewController {
    
    let mainLabel = UILabel()
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        return button
    }()

    var someString: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configureUI()
    }
    
    func setup() {
        mainLabel.text = someString
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        
        view.addSubview(mainLabel) // 화면에 표시
        view.addSubview(backButton)
        
        view.backgroundColor = .gray
    }
    
    func configureUI() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false // 오토레이아웃 세팅
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true // 0 -> 가운데에 놔두겠다!(지워도 됨!)
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func backButtonTapped() {
        // 다시 전화면으로!
        dismiss(animated: true, completion: nil)
    }

}
