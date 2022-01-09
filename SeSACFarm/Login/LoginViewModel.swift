import Foundation

class LoginViewModel {
    
    var email: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    
    func postUserLogin(completion: @escaping () -> Void) {
        
        APIService.login(email: email.value, password: password.value) { userData, error in
            
            guard let userData = userData else {
                return
            }
            
            UserDefaults.standard.set(userData.jwt, forKey: "token")
            UserDefaults.standard.set(userData.user.username, forKey: "username")
            UserDefaults.standard.set(userData.user.id, forKey: "id")
            UserDefaults.standard.set(userData.user.email, forKey: "email")
            
            completion()
        }
    }
}
