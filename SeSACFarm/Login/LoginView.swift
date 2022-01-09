import UIKit
import SnapKit

class LoginView: UIView, ViewRepresentable {
    
    let title = "새싹농장 로그인하기"
    let emailTF = UITextField()
    let passwordTF = UITextField()
    let loginButton = UIButton()
    let stackView = UIStackView()
    
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
        
        emailTF.placeholder = "이메일 주소"
        emailTF.borderStyle = .roundedRect
        passwordTF.placeholder = "비밀번호"
        passwordTF.borderStyle = .roundedRect
        passwordTF.isSecureTextEntry = true
        
        loginButton.setTitle("시작하기", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        loginButton.backgroundColor = UIColor(named: "AccentColor")
        loginButton.layer.cornerRadius = 5
        
        stackView.addArrangedSubview(emailTF)
        stackView.addArrangedSubview(passwordTF)
        stackView.addArrangedSubview(loginButton)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addSubview(stackView)
    }
    
    func setUpConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
            //make.top.equalToSuperview().offset(48)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
    }


}
