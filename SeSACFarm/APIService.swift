import Foundation

enum APIError: Error {
    case invalidResponse
    case noData
    case failed
    case invalidData
    case invalidToken   //상태코드 401    
}

let baseUrl: String = "http://test.monocoding.com:1231"

class APIService {
    
    /*
     //중복코드 합쳐보기
    func dataTask(request: URLRequest) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: request) { data, response, error in
            
        }
    }
    */
    
    static func signup(username: String, email: String, password: String, completion: @escaping (User?, APIError?) -> Void) {
        
        var request = URLRequest(url: URL(string: baseUrl + "/auth/local/register")!)
        request.httpMethod = "POST"
        request.httpBody = "username=\(username)&email=\(email)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            //print(data, response, error)
            
            guard error == nil else {
                completion(nil, .failed)
                return
            }
            
            guard let data = data else {
                completion(nil, .noData)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, .invalidResponse)
                return
            }
            
            guard response.statusCode == 200 else {
                completion(nil, .failed)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(User.self, from: data)
                completion(userData, nil)
            } catch {
                completion(nil, .invalidData)
            }
            
        }.resume()
    }
    
    static func login(email: String, password: String, completion: @escaping (User?, APIError?) -> Void) {
        
        var request = URLRequest(url: URL(string: baseUrl + "/auth/local")!)
        request.httpMethod = "POST"
        request.httpBody = "identifier=\(email)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(nil, .failed)
                return
            }
            
            guard let data = data else {
                completion(nil, .noData)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, .invalidResponse)
                return
            }
            
            guard response.statusCode == 200 else {
                completion(nil, .failed)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(User.self, from: data)
                completion(userData, nil)
            } catch {
                completion(nil, .invalidData)
            }
            
        }.resume()
    }
    
    static func board(token : String, completion: @escaping (Post?, APIError?) -> Void) {
        
        var request = URLRequest(url: URL(string: baseUrl + "/post?_sort=created_at:desc")!)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField:"Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(nil, .failed)
                return
            }
            
            guard let data = data else {
                completion(nil, .noData)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, .invalidResponse)
                return
            }
            
            guard response.statusCode == 200 else {
                completion(nil, .failed)
                return
            }
            
        }.resume()
    }
}
