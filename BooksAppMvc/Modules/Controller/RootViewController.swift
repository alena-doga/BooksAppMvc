//
//  RootViewController.swift
//  BooksAppMvc
//
//  Created by Alena on 15.07.2024.
//

import UIKit

class RootViewController: UIViewController {

    private let rootView = RootView()

    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        rootView.welcomeButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }

    @objc func startButtonTapped() {
        let secondVc = MyBooksViewController()
        navigationController?.pushViewController(secondVc, animated: true)
    }
}
