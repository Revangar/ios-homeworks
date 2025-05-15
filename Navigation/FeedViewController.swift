//
//  FeedViewController.swift
//  Navigation
//
//  Created by Revangar on 15.05.2025.
//


import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Feed"

        let button = UIButton(type: .system)
        button.setTitle("Open Post", for: .normal)
        button.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        view.addSubview(button)
    }

    @objc func openPost() {
        let post = Post(title: "My Post Title")
        let vc = PostViewController(post: post)
        navigationController?.pushViewController(vc, animated: true)
    }
}