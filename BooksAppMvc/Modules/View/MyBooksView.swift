//
//  MyBooksView.swift
//  BooksAppMvc
//
//  Created by Alena on 15.07.2024.
//

import UIKit

class MyBooksView: UIView {
    
       let addBooksButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "plus.square"), for: .normal)
        btn.tintColor = .systemGreen // Используйте соответствующий цвет
        btn.setTitle(" Додати книгу", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        btn.setTitleColor(.systemGreen, for: .normal) // Используйте соответствующий цвет
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
        let lineView: UIView = {
            let view = UIView()
            view.backgroundColor = .lightGray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
    }()
    
    let tableView: UITableView = {
            let tableView = UITableView()
            tableView.backgroundColor = .white
            tableView.translatesAutoresizingMaskIntoConstraints = false
            return tableView
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(addBooksButton)
        addSubview(lineView)
        addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            addBooksButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            addBooksButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            addBooksButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            lineView.topAnchor.constraint(equalTo: addBooksButton.bottomAnchor, constant: 10),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            tableView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
