import UIKit

protocol CustomSearchDelegate: AnyObject {
    func search(query: String)
}

class CustomSearchView: UIView, UISearchBarDelegate {
    
    weak var delegate: CustomSearchDelegate?
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search..."
        searchBar.delegate = self
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.backgroundColor = .white
        return searchBar
    }()
    
    init(delegate: CustomSearchDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        delegate?.search(query: query)
        searchBar.resignFirstResponder() // Hide the keyboard
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder() // Hide the keyboard
    }
}



