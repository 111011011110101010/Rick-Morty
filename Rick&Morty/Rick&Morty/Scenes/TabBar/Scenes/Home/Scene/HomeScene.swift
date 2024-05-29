import UIKit
import SnapKit

protocol HomeSceneDelegate: AnyObject {
    
    func didTap(title: String)
    
}

final class HomeScene: UIViewController, HomeSceneBaseViewDelegate {
    
    func didTapHomeSceneBaseView(title: String) {
        delegate?.didTap(title: title)
    }
    
    lazy var baseView = HomeSceneBaseView(delegate: self)
    
    weak var delegate: HomeSceneDelegate?
    
    init(delegate: HomeSceneDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }
    
    func setupSubViews() {
        
        view.addSubview(baseView)
        
        baseView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

