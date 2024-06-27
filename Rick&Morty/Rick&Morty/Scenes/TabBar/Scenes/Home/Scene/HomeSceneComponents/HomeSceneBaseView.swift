import UIKit
import SnapKit

protocol HomeSceneBaseViewDelegate: AnyObject {
    func didTapHomeSceneBaseView(title: String)
}

final class HomeSceneBaseView: UIView {
    
    weak var delegate: HomeSceneBaseViewDelegate?
    
    init(delegate: HomeSceneBaseViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupCollectionView()
        setupConstraints()
        setupSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let arrayMock = [
        "Season 1", "Season 2", "Season 3", "Season 4", "Season 5",
        "Season 6", "Season 7", "Season 8", "Season 9", "Season 10"
    ]
    
    private var arrayNewMock: [String] = []
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return !searchBarIsEmpty
    }
    
    private let baseLogo: UIImageView = {
        let baseLogo = UIImageView()
        baseLogo.contentMode = .scaleAspectFit
        baseLogo.image = UIImage(named: "rm_logo")
        return baseLogo
    }()
    
    private let infoCollection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 48, height: 357)
        flowLayout.minimumLineSpacing = 55
        let infoCollection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        infoCollection.backgroundColor = .white
        return infoCollection
    }()
    
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Name or episode (ex.S01E01)..."
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundImage = UIImage()
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        searchBar.layer.cornerRadius = 8
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .clear
            textField.borderStyle = .none
            textField.layer.cornerRadius = 8
            textField.layer.masksToBounds = true
        }
        
        return searchBar
    }()
    
    private let labelMock: UILabel = {
        let labelMock = UILabel()
        labelMock.layer.backgroundColor = .init(red: 111/255, green: 123/255, blue: 231/255, alpha: 1)
        labelMock.text = "ADVANCED FILTERS"
        labelMock.font = UIFont.systemFont(ofSize: 14)
        labelMock.textAlignment = .center
        labelMock.layer.borderWidth = 1.5
        labelMock.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.7)
        labelMock.layer.cornerRadius = 15
        
        return labelMock
    }()
    
    private func setupCollectionView() {
        infoCollection.delegate = self
        infoCollection.dataSource = self
        infoCollection.register(EpisodeCell.self, forCellWithReuseIdentifier: EpisodeCell.identifier)
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    func setupConstraints() {
        backgroundColor = .white
        addSubview(baseLogo)
        addSubview(infoCollection)
        addSubview(searchBar)
        addSubview(labelMock)
        
        baseLogo.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.top.equalToSuperview().offset(57)
            $0.height.equalTo(104)
            $0.width.equalTo(312)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(228)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(56)
            $0.width.equalTo(312)
        }
        
        searchBar.searchTextField.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        infoCollection.snp.makeConstraints {
            $0.top.equalToSuperview().offset(382)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().offset(-85)
        }
        
        labelMock.snp.makeConstraints {
            $0.width.equalTo(312)
            $0.height.equalTo(56)
            $0.top.equalToSuperview().offset(296)
            $0.horizontalEdges.equalToSuperview().inset(21)
        }
    }
}

extension HomeSceneBaseView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isFiltering ? arrayNewMock.count : arrayMock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = infoCollection.dequeueReusableCell(withReuseIdentifier: EpisodeCell.identifier, for: indexPath) as? EpisodeCell else { return UICollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedTitle = isFiltering ? arrayNewMock[indexPath.item] : arrayMock[indexPath.item]
        delegate?.didTapHomeSceneBaseView(title: selectedTitle)
    }
}

extension HomeSceneBaseView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        arrayNewMock = arrayMock.filter({ season in
            return season.lowercased().contains(searchText.lowercased())
        })
        infoCollection.reloadData()
    }
}
