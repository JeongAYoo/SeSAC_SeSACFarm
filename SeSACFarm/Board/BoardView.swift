import UIKit
import SnapKit

class BoardView: UIView, ViewRepresentable {
    
    let title = "새싹농장"
    let tableView = UITableView()
    
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
        addSubview(tableView)
    }
    
    func setUpConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide)
        }
    }

}
