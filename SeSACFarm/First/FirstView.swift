import UIKit
import SnapKit

class FirstView: UIView, ViewRepresentable {
    
    let logoImageView = UIImageView()
    
    let text1Label = UILabel()
    let text2Label = UILabel()
    let text3Label = UILabel()
    
    let startButton = UIButton()
    let loginButton = UIButton()
    
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
        
        logoImageView.image = UIImage(named: "logo_ssac_clear")
        logoImageView.contentMode = .scaleAspectFill
        text1Label.text = "당신 근처의 새싹농장"
        text1Label.font = .boldSystemFont(ofSize: 22)
        text2Label.text = "iOS 지식부터 바람의 나라까지\n지금 SeSAC에서 함께해보세요!"
        text2Label.font = .systemFont(ofSize: 15)
        text2Label.numberOfLines = 0
        text2Label.textAlignment = .center
        text3Label.text = "이미 계정이 있나요?"
        text3Label.font = .systemFont(ofSize: 13)
        text3Label.textColor = .lightGray
        
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        startButton.backgroundColor = UIColor(named: "AccentColor")
        startButton.layer.cornerRadius = 5
        
        loginButton.setTitle("로그인", for: .normal)
        loginButton.setTitleColor(UIColor(named: "AccentColor"), for: .normal)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 13)
        
        addSubview(logoImageView)
        addSubview(text1Label)
        addSubview(text2Label)
        addSubview(text3Label)
        addSubview(startButton)
        addSubview(loginButton)
    }
    
    func setUpConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-120)
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        text1Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(10)
        }
        
        text2Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(text1Label.snp.bottom).offset(10)
        }
        
        
        text3Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-48)
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(text3Label.snp.top).offset(-16)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(44)
        }
       
        loginButton.snp.makeConstraints { make in
            make.leading.equalTo(text3Label.snp.trailing)
            make.centerY.equalTo(text3Label.snp.centerY)
        }
        
    }
    
    
}
