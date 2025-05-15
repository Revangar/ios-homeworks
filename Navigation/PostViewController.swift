//
//  PostViewController.swift
//  Navigation
//
//  Created by Revangar on 15.05.2025.
//


import UIKit

class PostViewController: UIViewController {

    let post: Post

    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = post.title
        view.backgroundColor = .systemYellow

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(showInfo))
    }

    @objc func showInfo() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}