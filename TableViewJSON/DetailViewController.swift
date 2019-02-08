import UIKit

class DetailViewController: UIViewController {
    
    var item: Item?
    
    init(item: Item?) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        textView.fillSuperview()
        showText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showText() {
        textView.text = item?.name
    }
}
