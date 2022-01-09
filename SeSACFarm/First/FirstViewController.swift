import UIKit

class FirstViewController: UIViewController {
    
    let mainView = FirstView()
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        mainView.startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        mainView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    
    @objc func startButtonClicked() {
        let vc = SignupViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginButtonClicked() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
