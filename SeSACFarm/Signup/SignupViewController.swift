import UIKit

//유효성 검사 추가 - 1. 이메일 형식 2. 비번 6자 이상, 영문자+숫자 or +특 포함 3. 비번,비번확인 일치한지
class SignupViewController: UIViewController {

    let mainView = SignupView()
    let viewModel = SignupViewModel()

    override func loadView() {
        super.loadView()
        self.view = mainView
        self.title = mainView.title
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.email.bind { text in
            self.mainView.emailTF.text = text
        }
        viewModel.username.bind { text in
            self.mainView.usernameTF.text = text
        }
        viewModel.password.bind { text in
            self.mainView.passwordTF.text = text
        }
        viewModel.passwordCheck.bind { text in
            self.mainView.passwordCheckTF.text = text
        }
        
        mainView.emailTF.addTarget(self, action: #selector(emailTFDidChange(_:)), for: .editingChanged)
        mainView.usernameTF.addTarget(self, action: #selector(usernameTFDidChange(_:)), for: .editingChanged)
        mainView.passwordTF.addTarget(self, action: #selector(passwordTFDidChange(_:)), for: .editingChanged)
        mainView.passwordCheckTF.addTarget(self, action: #selector(passwordCheckTFDidChange(_:)), for: .editingChanged)
        mainView.signupButton.addTarget(self, action: #selector(signupButtonClicked), for: .touchUpInside)
    }

    @objc func emailTFDidChange(_ textfield: UITextField) {
        viewModel.email.value = textfield.text ?? ""
    }
    
    @objc func usernameTFDidChange(_ textfield: UITextField) {
        viewModel.username.value = textfield.text ?? ""
    }
    
    @objc func passwordTFDidChange(_ textfield: UITextField) {
        viewModel.password.value = textfield.text ?? ""
    }
    
    @objc func passwordCheckTFDidChange(_ textfield: UITextField) {
        viewModel.passwordCheck.value = textfield.text ?? ""
    }
    
    @objc func signupButtonClicked() {
        viewModel.postUserSignup {
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: BoardViewController())
                windowScene.windows.first?.makeKeyAndVisible()
            }
        }
    }
}
