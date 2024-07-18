//
//  AddNewBooksViewController.swift
//  BooksAppMvc
//
//  Created by Alena on 15.07.2024.
//

import UIKit

class AddNewBooksViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    protocol AddNewBooksViewControllerDelegate: AnyObject {
        func didAddNewBook(_ book: Book)
    }

    
    weak var delegate: AddNewBooksViewControllerDelegate?
    
    
    private let imagePicker = ImagePicker()
    private var selectedImage: UIImage?
    private let customView = AddNewBooksView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backButtonTapped))
        
        navigationItem.leftBarButtonItem = backButton
        
        customView.addCoverButton.addTarget(self, action: #selector(addCover), for: .touchUpInside)
        customView.slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        customView.saveButton.addTarget(self, action: #selector(toSaveData), for: .touchUpInside)
        
        setupDelegates()
    }
    // кнопка назад
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    // добавление обложки
    @objc private func addCover() {
            imagePicker.showImagePicker(in: self) { [weak self] image in
            self?.customView.imageView.image = image
            self?.selectedImage = image
        }
    }
    // слайдер
    @objc private func sliderValueChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        customView.numberTitle.text = "\(value)"
    }
    
    // сохранение данных в тексФилдах
    @objc private func toSaveData() {
        guard let title = customView.titleTextField.text, !title.isEmpty,
                   let author = customView.authorTextField.text, !author.isEmpty,
                   let yearText = customView.yearTextField.text, let year = Int(yearText),
                   let impression = customView.impressionTextView.text, !impression.isEmpty else {
                 let alert = UIAlertController(title: "Ошибка", message: "Пожалуйста, заполните все поля", preferredStyle: .alert)
                 alert.addAction(UIAlertAction(title: "ОК", style: .default))
                 present(alert, animated: true)
                 return
             }
             
             let grade = Int(customView.slider.value)
             let imageData = selectedImage?.pngData()
             
        let book = Book(imageData: imageData, title: title, author: author, year: year, impression: impression, grade: grade)
             
             delegate?.didAddNewBook(book)
             
             navigationController?.popViewController(animated: true)
            }
    
    // delegate textField
    private func setupDelegates() {
        customView.titleTextField.delegate = self
        customView.authorTextField.delegate = self
        customView.yearTextField.delegate = self
        customView.impressionTextView.delegate = self
    }
    
    // переход клавиатуры
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == customView.titleTextField {
            customView.authorTextField.becomeFirstResponder()
        } else if textField == customView.authorTextField {
            customView.yearTextField.becomeFirstResponder()
        } else if textField == customView.yearTextField {
            customView.yearTextField.resignFirstResponder()
        }
        return true
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
