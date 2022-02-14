//
//  HomeViewController.swift
//  SyncLocalToCloud
//
//  Created by Brian Veitch on 2/12/22.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    let uploadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upload", for: .normal)
        button.setDimensions(width: 0, height: 50)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(upload), for: .touchUpInside)
        return button
    }()
    
    let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.setDimensions(width: 0, height: 50)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(download), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        
        self.title = "Sync"
        view.backgroundColor = .white
        
        let stackview = UIStackView(arrangedSubviews: [uploadButton, downloadButton])
        stackview.axis = .vertical
        stackview.spacing = 20
        stackview.distribution = .fillEqually
        
        view.addSubview(stackview)
        
        stackview.center(inView: view)
        stackview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stackview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
    }
    
    @objc func upload() {
        
        let reference = Database.database().reference()
        
        DataManager.shared.upload()
        
    }
    
    @objc func download() {
        DataManager.shared.download()
    }
    

}
