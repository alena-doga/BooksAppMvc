//
//  AddNewBooksView.swift
//  BooksAppMvc
//
//  Created by Alena on 15.07.2024.
//

import UIKit

class AddNewBooksView: UIView {
    
    let stackViewHorizontal: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let viewFor: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "photo.fill")
        imgView.tintColor = .gray
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let addCoverButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Додати обкладинку", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        btn.setTitleColor(.lightGreen, for: .normal)
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Назва книги"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .next
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Автор"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let authorTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .next
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.text = "Рік видання"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let yearTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let impressionLabel: UILabel = {
        let label = UILabel()
        label.text = "Враження про книгу"
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let impressionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.returnKeyType = .done
        textView.autocorrectionType = .yes
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let gradeLabel: UILabel = {
        let label = UILabel()
        label.text = "Моя оцінка"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageViewHeart: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "heart.fill")
        imgView.tintColor = .orange
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let numberTitle: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .lightGreen
        slider.maximumTrackTintColor = .lightGray
        slider.value = 2
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    let saveButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Зберегти", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .lightGreen
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        stackViewVertical.addArrangedSubview(imageView)
        stackViewVertical.addArrangedSubview(addCoverButton)
        
        stackViewHorizontal.addArrangedSubview(stackViewVertical)
        stackViewHorizontal.addArrangedSubview(viewFor)
        
        viewFor.addSubview(titleLabel)
        viewFor.addSubview(titleTextField)
        viewFor.addSubview(authorLabel)
        viewFor.addSubview(authorTextField)
        viewFor.addSubview(yearLabel)
        viewFor.addSubview(yearTextField)
        
        addSubview(stackViewHorizontal)
        addSubview(impressionLabel)
        addSubview(impressionTextView)
        addSubview(gradeLabel)
        addSubview(imageViewHeart)
        addSubview(numberTitle)
        addSubview(slider)
        addSubview(saveButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackViewHorizontal.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stackViewHorizontal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackViewHorizontal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackViewHorizontal.heightAnchor.constraint(equalToConstant: 195),
            
            imageView.widthAnchor.constraint(equalToConstant: 160),
            imageView.heightAnchor.constraint(equalToConstant: 155),
            
            titleLabel.topAnchor.constraint(equalTo: viewFor.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: viewFor.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: viewFor.trailingAnchor, constant: -5),
            
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            titleTextField.leadingAnchor.constraint(equalTo: viewFor.leadingAnchor, constant: 5),
            titleTextField.trailingAnchor.constraint(equalTo: viewFor.trailingAnchor, constant: -5),
            
            authorLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: viewFor.leadingAnchor, constant: 5),
            authorLabel.trailingAnchor.constraint(equalTo: viewFor.trailingAnchor, constant: -5),
            
            authorTextField.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 5),
            authorTextField.leadingAnchor.constraint(equalTo: viewFor.leadingAnchor, constant: 5),
            authorTextField.trailingAnchor.constraint(equalTo: viewFor.trailingAnchor, constant: -5),
            
            yearLabel.topAnchor.constraint(equalTo: authorTextField.bottomAnchor, constant: 5),
            yearLabel.leadingAnchor.constraint(equalTo: viewFor.leadingAnchor, constant: 5),
            yearLabel.trailingAnchor.constraint(equalTo: viewFor.trailingAnchor, constant: -5),
            
            yearTextField.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 5),
            yearTextField.leadingAnchor.constraint(equalTo: viewFor.leadingAnchor, constant: 5),
            yearTextField.trailingAnchor.constraint(equalTo: viewFor.trailingAnchor, constant: -5),
            
            impressionLabel.topAnchor.constraint(equalTo: stackViewHorizontal.bottomAnchor, constant: 15),
            impressionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            impressionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            impressionTextView.topAnchor.constraint(equalTo: impressionLabel.bottomAnchor, constant: 10),
            impressionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            impressionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            impressionTextView.heightAnchor.constraint(equalToConstant: 140),
            
            gradeLabel.topAnchor.constraint(equalTo: impressionTextView.bottomAnchor, constant: 15),
            gradeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            gradeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            imageViewHeart.topAnchor.constraint(equalTo: gradeLabel.bottomAnchor, constant: 10),
            imageViewHeart.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageViewHeart.widthAnchor.constraint(equalToConstant: 40),
            imageViewHeart.heightAnchor.constraint(equalToConstant: 40),
            
            numberTitle.centerXAnchor.constraint(equalTo: imageViewHeart.centerXAnchor),
            numberTitle.centerYAnchor.constraint(equalTo: imageViewHeart.centerYAnchor),
            
            slider.topAnchor.constraint(equalTo: numberTitle.bottomAnchor, constant: 10),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            saveButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 15),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
