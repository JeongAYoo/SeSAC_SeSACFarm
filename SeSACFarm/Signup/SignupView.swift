import UIKit
import SnapKit

class SignupView: UIView, ViewRepresentable {
    
    let title = "새싹농장 가입하기"
    let emailTF = UITextField()
    let usernameTF = UITextField()
    let passwordTF = UITextField()
    let passwordCheckTF = UITextField()
    let signupButton = UIButton()
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
        usernameTF.placeholder = "닉네임"
        usernameTF.borderStyle = .roundedRect
        passwordTF.placeholder = "비밀번호(영문, 숫자 포함 6자리 이상)"
        passwordTF.borderStyle = .roundedRect
        passwordCheckTF.placeholder = "비밀번호 확인"
        passwordCheckTF.borderStyle = .roundedRect
        
        passwordTF.isSecureTextEntry = true
        passwordCheckTF.isSecureTextEntry = true
        
        signupButton.setTitle("가입하기", for: .normal)
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        signupButton.backgroundColor = UIColor(named: "AccentColor")
        signupButton.layer.cornerRadius = 5
        
        //addSubview(backButton)
        stackView.addArrangedSubview(emailTF)
        stackView.addArrangedSubview(usernameTF)
        stackView.addArrangedSubview(passwordTF)
        stackView.addArrangedSubview(passwordCheckTF)
        stackView.addArrangedSubview(signupButton)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addSubview(stackView)
    }
    
    func setUpConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.6)
            //make.top.equalToSuperview().offset(48)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }


}
