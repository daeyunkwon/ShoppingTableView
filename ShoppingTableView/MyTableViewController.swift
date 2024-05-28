//
//  MyTableViewController.swift
//  test
//
//  Created by 권대윤 on 5/24/24.
//

import UIKit

struct Shopping {
    let item: String
    var check: Bool = false
    var favorite: Bool = false
}

class MyTableViewController: UITableViewController {
    
    @IBOutlet var headerBackView: UIView!
    @IBOutlet var headerSubBackView: UIView!
    @IBOutlet var headerTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var array: [Shopping] = [
        Shopping(item: "그립톡 구매하기", check: true, favorite: true),
        Shopping(item: "사이다 구매하기", check: false, favorite: false),
        Shopping(item: "아이패드 케이스 최저가 알아보기", check: false, favorite: true),
        Shopping(item: "양말", check: false, favorite: true),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "쇼핑"
        
        headerBackView.backgroundColor = .clear
        
        headerSubBackView.backgroundColor = .systemGray5
        headerSubBackView.layer.cornerRadius = 10
        
        headerTextField.borderStyle = .none
        headerTextField.placeholder = "무엇을 구매하실 건가요?"
        headerTextField.textColor = .black
        
        addButton.backgroundColor = .systemGray4
        addButton.setTitle("추가", for: .normal)
        addButton.tintColor = .black
        addButton.layer.cornerRadius = 10
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyTableViewCell

        let data = array[indexPath.row]
        
        cell.itemLabel.text = data.item
        
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        cell.starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        
        cell.checkButton.tag = indexPath.row
        cell.starButton.tag = indexPath.row
        
        if data.check {
            cell.checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            cell.checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        
        if data.favorite {
            cell.starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            cell.starButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    //MARK: - Functions
    
    func showTextFieldEmptyAlert() {
        let alert = UIAlertController(title: "알림", message: "내용을 입력해주세요.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }

    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let text = headerTextField.text else {return}
        
        let item = text.trimmingCharacters(in: .whitespaces)
        
        if item.isEmpty {
            showTextFieldEmptyAlert()
            return
        } else {
            let shopping = Shopping(item: item)
            
            self.array.append(shopping)
            
            tableView.reloadData()
            
            headerTextField.text = ""
        }
    }
    
    @objc func checkButtonTapped(sender: UIButton) {
        array[sender.tag].check.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    @objc func starButtonTapped(sender: UIButton) {
        array[sender.tag].favorite.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    


}
