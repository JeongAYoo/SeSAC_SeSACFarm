//1.6 강의 중 코드 그대로. 이해 필요ㅠㅠ
import Foundation

class Observable<T> {
    private var listener: ( (T) -> Void )?  //어떤 매개변수가 들어갈지 모름. 반환값은 없음.
    
    var value: T {
        didSet {    //값이 변할때마다 클로저 구문 실행. 리스너의 매개변수에 값 전달
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
