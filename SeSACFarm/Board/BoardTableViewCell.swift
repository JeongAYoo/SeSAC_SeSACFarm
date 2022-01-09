//
//  BoardTableViewCell.swift
//  SeSACFarm
//
//  Created by Jade Yoo on 2022/01/09.
//

import UIKit

class BoardTableViewCell: UITableViewCell, ViewRepresentable {
    
    let stackView = UIStackView()
    let writerLabel = UILabel()
    let contentLabel = UILabel()
    let dateLabel = UILabel()
    let commentImage = UIImageView()
    let commentLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpView() {
        
        dateLabel.font = UIFont.systemFont(ofSize: 13)
        commentImage.image = UIImage(systemName: "bubble.right")
        
        stackView.addArrangedSubview(writerLabel)
        stackView.addArrangedSubview(contentLabel)
        stackView.addArrangedSubview(dateLabel)
        addSubview(commentImage)
        addSubview(commentLabel)
        
    }
    
    func setUpConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview()
        }
        commentImage.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom)
            make.leading.equalToSuperview()
        }
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom)
            make.leading.equalTo(commentImage.snp.trailing)
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
