import UIKit

class LoginViewController: UIViewController {
    
    let mainView = LoginView()
    let viewModel = LoginViewModel()

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
        viewModel.password.bind { text in
            self.mainView.passwordTF.text = text
        }

        mainView.emailTF.addTarget(self, action: #selector(emailTFDidChange(_:)), for: .editingChanged)
        mainView.passwordTF.addTarget(self, action: #selector(passwordTFDidChange(_:)), for: .editingChanged)
        mainView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)

    }
    
    @objc func emailTFDidChange(_ textfield: UITextField) {
        viewModel.email.value = textfield.text ?? ""

    }

    @objc func passwordTFDidChange(_ textfield: UITextField) {
        viewModel.password.value = textfield.text ?? ""
    }
    
    @objc func loginButtonClicked() {
        viewModel.postUserLogin {
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: BoardViewController())
                windowScene.windows.first?.makeKeyAndVisible()
            }
        }
    }

}
