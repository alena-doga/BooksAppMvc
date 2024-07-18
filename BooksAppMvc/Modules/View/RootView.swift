//
//  RootView.swift
//  BooksAppMvc
//
//  Created by Alena on 15.07.2024.
//

import UIKit

class RootView: UIView {
    
  private let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "root_Main_Image")
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let welcomeLabel: UILabel = {
        let labelView = UILabel()
        labelView.text = "Вітаємо у нашому книжковому куточку!"
        labelView.font = UIFont.preferredFont(forTextStyle: .title1)
        labelView.numberOfLines = 0
        labelView.textColor = UIColor(named: "rootDarkGreen")
        labelView.textAlignment = .center
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    private let descriptionLabel: UILabel = {
        let labelView = UILabel()
        labelView.text = "Додайте свої улюблені книги до колекції, пишіть нотатки та ділитесь своїми враженнями з іншими."
        labelView.font = UIFont.preferredFont(forTextStyle: .title2)
        labelView.numberOfLines = 0
        labelView.textColor = UIColor.black
        labelView.textAlignment = .center
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
     let welcomeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Почати", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .lightGreen
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(welcomeButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Constraints для imageView
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 280),
            
            //Constraints для welcomeLabel
            welcomeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            //Constraints для descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            //Constraints для welcomeButton
            welcomeButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            welcomeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            welcomeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            welcomeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
