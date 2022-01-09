//
//  BoardViewModel.swift
//  SeSACFarm
//
//  Created by Jade Yoo on 2022/01/08.
//

import Foundation

class BoardViewModel {
    
    var posts = Array<Post>()
    var numberOfPosts = 0
    
    func getBoard(completion: @escaping () -> Void) {
        
        if let token = UserDefaults.standard.string(forKey: "token") {
            APIService.board(token: token) { boardData, error in
                
                guard let boardData = boardData else {
                    return
                }
                
                self.posts.append(boardData)
                print(self.posts)
                self.numberOfPosts = self.posts.count
                completion()
            }
        }
        //print(posts[1])
    }
}
