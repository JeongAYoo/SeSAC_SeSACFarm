import UIKit

class BoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let mainView = BoardView()
    let viewModel = BoardViewModel()

    override func loadView() {
        super.loadView()
        self.view = mainView
        self.title = mainView.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getBoard {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(BoardTableViewCell.self, forCellReuseIdentifier: "BoardTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPosts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BoardTableViewCell", for: indexPath) as? BoardTableViewCell else { return UITableViewCell() }
        
        cell.writerLabel.text = viewModel.posts[indexPath.row].user.user.username
        cell.contentLabel.text = viewModel.posts[indexPath.row].text
        cell.dateLabel.text = viewModel.posts[indexPath.row].createdAt
        cell.commentLabel.text = "댓글 \(viewModel.posts[indexPath.row].comments.count)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

}
