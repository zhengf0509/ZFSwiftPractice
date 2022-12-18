//
//  ViewController.swift
//  ZFSwiftPractice
//
//  Created by 郑峰 on 2022/12/14.
//

import UIKit

var tip = 0

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource,
                      UISearchBarDelegate {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tip,": viewDidLoad")
        tip += 1
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(tip,": viewWillLayoutSubviews")
        tip += 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(tip,": viewWillAppear")
        tip += 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 280, height: 300))
//        label.backgroundColor = UIColor.red
//        label.text = "hello world dasdasfajdkfshflsdalfhlksdfhahklajk; 哈哈哈"
////        label.shadowColor = UIColor.green
////        label.shadowOffset = CGSize(width: 10, height: 10)
//        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
//        self.view.addSubview(label)
//
//        let button = UIButton(type: .system)
////        button.setBackgroundImage(UIImage(named: "ruhua"), for: .normal)
//        button.backgroundColor = UIColor.red
//        button.frame = CGRect(x: 40, y: 500, width: 300, height: 300)
//        let image = UIImage(named: "ruhua")
//        button.setImage(image, for: .normal)
//        button.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
//        button.imageView?.contentMode = .scaleAspectFit
//        button.setTitle("点我一下", for: .normal)
//        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
//        self.view.addSubview(button)
        
//        let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
//        textField.borderStyle = .bezel
//        textField.placeholder = "请输入文字"
//        let imageView = UIImageView(image:  UIImage(named: "photo"))
//        textField.leftView = imageView
//        textField.leftViewMode = .always
//        textField.delegate = self;
//        self.view.addSubview(textField)
        
//        let swi = UISwitch(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
//        swi.tintColor = UIColor.black
//        swi.onTintColor = UIColor.red
//        swi.thumbTintColor = UIColor.green
//        swi.addTarget(self, action: #selector(changeSwitch), for: .valueChanged)
//        self.view.addSubview(swi)
        
//        self.view.backgroundColor = UIColor.black
//        let page = UIPageControl(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
//        page.currentPageIndicatorTintColor = UIColor.red
//        page.numberOfPages = 8
//        page.addTarget(self, action: #selector(changePage), for: .valueChanged)
//        self.view.addSubview(page)
        
//        let progressView = UIProgressView(frame: CGRect(x: 20, y: 100, width: 280, height:30))
//        progressView.progressTintColor = UIColor.red
//        progressView.trackTintColor = UIColor.blue
//        progressView.progress = 0.5;
//        self.view.addSubview(progressView)
        
//        let stepper = UIStepper()
//        stepper.center = CGPoint(x: 100, y: 100)
//        stepper.isContinuous = true
//        stepper.autorepeat = true
//        stepper.wraps = true
//        stepper.minimumValue = 1
//        stepper.maximumValue = 10
//        stepper.stepValue = 1
//        stepper.tintColor = UIColor.red
//        self.view .addSubview(stepper)
//        stepper.addTarget(self, action: #selector(clickStepper), for: .valueChanged)
        
//        let picker = UIPickerView(frame: CGRect(x: 20, y: 100, width: 280, height: 150))
//        picker.dataSource = self
//        picker.delegate = self
//        self.view.addSubview(picker)
        
        let searchBar = UISearchBar(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
        searchBar.placeholder = "请输入要搜索的内容"
        searchBar.showsScopeBar = true
        searchBar.showsCancelButton = true
        searchBar.showsBookmarkButton = true // 二选一显示
//        searchBar.showsSearchResultsButton = true // 二选一显示，后设置的会覆盖前面的设置
        searchBar.scopeButtonTitles = ["one", "two", "three"]
        searchBar.delegate = self
        self.view.addSubview(searchBar)
        
    }
    
    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count <= 0 {
            return true
        }
        
        let startIndex = string.index(string.startIndex, offsetBy: 0)
        
        if (string[startIndex] < "0" || string[startIndex] > "9") {
            print("请输入0～9")
            return false
        }
        
        if (textField.text!.count + string.count > 11) {
            print("超过11个了")
            return false
        }
        
        return true
    }
    
    // MARK: - action
    @objc func changeColor() {
        self.view.backgroundColor = UIColor(red: self.genRandomCGFloat(), green: self.genRandomCGFloat(), blue: self.genRandomCGFloat(), alpha: 1)
    }
    
    @objc func changeSwitch(swi:UISwitch) {
        if (swi.isOn) {
            self.view.backgroundColor = UIColor.blue
        } else {
            self.view.backgroundColor = UIColor.white
        }
    }
    
    @objc func changePage(page:UIPageControl) {
        print("当前page =", page.currentPage)
    }
    
    @objc func clickStepper(stepper:UIStepper) {
        print("当前stepper =", stepper.value)
    }
    
    // MARK: - helper
    func genRandomCGFloat() -> CGFloat {
        return CGFloat(arc4random() % 255) / 255.0
    }
    
    // MARK: - UIPickerViewDataSource
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    // MARK: - UIPickerViewDelegate
    // returns width of column and height of row for each component.
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 144
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(component)分区\(row)行数据"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(component)分区\(row)行数据")
    }
    
    // MARK: - UISearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("SearchButtonClicked")
    }


    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("BookmarkButtonClicked")
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("CancelButtonClicked")
    }

    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("ResultsListButtonClicked")
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("selectedScopeButtonIndexDidChange to", selectedScope)
    }
    
    // MARK: - UIResponser
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        return
        
        let alertView = UIAlertController(title: "标题", message: "警告的内容", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "按钮", style: .default) { (action:UIAlertAction) in
            print("click")
        }
        let action2 = UIAlertAction(title: "取消", style: .cancel) { (action:UIAlertAction) in
            print("取消")
        }
        let action3 = UIAlertAction(title: "注意", style: .destructive) { (action:UIAlertAction) in
            print("注意")
        }
        alertView.addAction(action1)
        alertView.addAction(action2)
        alertView.addAction(action3)
        alertView.addTextField { (textField:UITextField) in
            textField.placeholder = "place"
        }
        self.present(alertView, animated: true, completion: nil)
    }

}





