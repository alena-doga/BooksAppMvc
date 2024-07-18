//
//  MyBooksViewController.swift
//  BooksAppMvc
//
//  Created by Alena on 15.07.2024.
//

import UIKit

class MyBooksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddNewBooksViewController.AddNewBooksViewControllerDelegate {
    
    private let customView = MyBooksView()
    
    private var books: [Book] = [] {
        didSet {
            saveBooks()
        }
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
        let nib = UINib(nibName: "BookTableViewCell", bundle: nil)
        customView.tableView.register(nib, forCellReuseIdentifier: "BookTableViewCell")
        
        loadBooks()
        setupActions()
        
        view.backgroundColor = .white
        
    }
    
    private func setupActions() {
        customView.addBooksButton.addTarget(self, action: #selector(addBook), for: .touchUpInside)
    }
    
    @objc private func addBook() {
        let addNewBooksVC = AddNewBooksViewController()
        addNewBooksVC.delegate = self
        navigationController?.pushViewController(addNewBooksVC, animated: true)
    }
    
    // MARK: - AddNewBooksViewControllerDelegate
    
    func didAddNewBook(_ book: Book) {
        books.append(book)
        customView.tableView.reloadData()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func screenForAddBooks() {
        let nextScreen = AddNewBooksViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        let book = books[indexPath.row]
        cell.tableTitle.text = book.title + " -"
        cell.tableAuthor.text = book.author
        cell.tableYear.text = String(book.year) + " рік"
        cell.tableGrade.text = String(book.grade) + "/10"
        cell.tableImpression.text = book.impression
        cell.tableImage.image = book.image
        
        
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // Добавление метода для редактирования ячейки
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Удаление данных из массива
            books.remove(at: indexPath.row)
            // Обновление таблицы
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] (action, view, completionHandler) in
            // Удаление данных из массива
            self?.books.remove(at: indexPath.row)
            // Обновление таблицы
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    // MARK: - Сохранение и загрузка данных
    
    private func saveBooks() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(books) {
            UserDefaults.standard.set(encoded, forKey: "books")
        }
    }
    
    private func loadBooks() {
        if let savedBooks = UserDefaults.standard.object(forKey: "books") as? Data {
            let decoder = JSONDecoder()
            if let loadedBooks = try? decoder.decode([Book].self, from: savedBooks) {
                books = loadedBooks
            }
        }
    }
}
