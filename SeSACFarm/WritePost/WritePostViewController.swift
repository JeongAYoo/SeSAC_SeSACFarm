//
//  WritePostViewController.swift
//  SeSACFarm
//
//  Created by Jade Yoo on 2022/01/08.
//

import UIKit

class WritePostViewController: UIViewController {
    
    let mainView = WritePostView()
    let viewModel = WritePostViewModel()

    override func loadView() {
        super.loadView()
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
