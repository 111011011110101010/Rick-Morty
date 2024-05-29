import UIKit


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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let arrayMock = [
        "Season 1",
        "Season 2",
        "Season 3",
        "Season 4",
        "Season 5",
        "Season 6",
        "Season 7",
        "Season 8",
        "Season 9",
        "Season 10"
        
    ]
    
    private var arrayNewMock: [String] = []
    
    private var searchBarIsEmpty: Bool {
        
        get {
            guard let text = searchController.searchBar.text else { return false }
            return text.isEmpty
        }
        
    }
    
    private var isFiltering: Bool {
        
        return searchController.isActive && !searchBarIsEmpty
        
    }
    
    private let baseLogo: UIImageView = {
        let baseLogo = UIImageView()
        baseLogo.contentMode = .scaleAspectFit
        baseLogo.image = UIImage(named: "rm_logo")
        
        return baseLogo
    }()
    
    private let infoCollection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 24, height: 357)
        let infoCollection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        return infoCollection
    }()
    
    private let searchController: UISearchController = {
        let searchControllerr = UISearchController(searchResultsController: nil)
        searchControllerr.obscuresBackgroundDuringPresentation = false
        searchControllerr.searchBar.placeholder = "Name or episode (ex.S01E01)..."
        
        
        return searchControllerr
    }()
    
    private func setupCollectionView() {
        infoCollection.delegate = self
        infoCollection.dataSource = self
        infoCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        searchController.searchResultsUpdater = self
        if let parentVC = delegate as? UIViewController {
            parentVC.navigationItem.searchController = searchController
            parentVC.definesPresentationContext = true
        }
    }
    
    func setupConstraints() {
        
        backgroundColor = .white
        addSubview(baseLogo)
        addSubview(infoCollection)
        
        baseLogo.snp.makeConstraints {
            
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.top.equalToSuperview().offset(57)
            $0.height.equalTo(104)
            $0.width.equalTo(312)
            
        }
        
        infoCollection.snp.makeConstraints {
            
            $0.top.equalToSuperview().offset(382)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().offset(-85)
            
        }
        
    }
    
}

extension HomeSceneBaseView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isFiltering {
            return arrayNewMock.count
        }
        
        return arrayMock.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = infoCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .red
        var defaultConfigure = UIListContentConfiguration.cell()
        
        var array: String
        
        if isFiltering {
            array = arrayNewMock[indexPath.item]
        } else {
            array = arrayMock[indexPath.item]
        }
        
        defaultConfigure.text = "Cell - \(array)"
        cell.contentConfiguration = defaultConfigure
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let selectedTitle = isFiltering ? arrayNewMock[indexPath.item] : arrayMock[indexPath.item]
        delegate?.didTapHomeSceneBaseView(title: selectedTitle)
        
    }
    
}

extension HomeSceneBaseView: UISearchResultsUpdating {
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let text = searchController.searchBar.text
        guard let text else { return }
        
        filterContentForSearchText(text)
        
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        arrayNewMock = arrayMock.filter({ season in
            return season.lowercased().contains(searchText.lowercased())
        })
        
        infoCollection.reloadData()
        
    }
    
}

    

