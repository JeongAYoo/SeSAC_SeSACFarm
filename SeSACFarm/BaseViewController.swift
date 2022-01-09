//
//  BaseViewController.swift
//  SeSACFarm
//
//  Created by Jade Yoo on 2022/01/08.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .white
    }
    
    func setupConstraints(){
        
    }
}
