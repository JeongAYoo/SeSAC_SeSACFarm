import UIKit

class DetailPostView: UIView, ViewRepresentable {
    
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
