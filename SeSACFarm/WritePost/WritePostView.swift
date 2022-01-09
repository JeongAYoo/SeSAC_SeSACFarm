//
//  WritePostView.swift
//  SeSACFarm
//
//  Created by Jade Yoo on 2022/01/08.
//

import UIKit

class WritePostView: UIView, ViewRepresentable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpView() {
        self.backgroundColor = .white
    }
    
    func setUpConstraints() {
        
    }

}
