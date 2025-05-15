//
//  InfoViewController.swift
//  Navigation
//
//  Created by Revangar on 15.05.2025.
//


import UIKit

class InfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let button = UIButton(type: .system)
        button.setTitle("Show Alert", for: .normal)
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func showAlert() {
        let alert = UIAlertController(title: "Info", message: "Some info here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            print("OK pressed")
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel pressed")
        })
        present(alert, animated: true)
    }
}