//
//  DetailPostViewController.swift
//  SeSACFarm
//
//  Created by Jade Yoo on 2022/01/08.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    let mainView = DetailPostView()
    let viewModel = DetailPostViewModel()

    override func loadView() {
        super.loadView()
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
