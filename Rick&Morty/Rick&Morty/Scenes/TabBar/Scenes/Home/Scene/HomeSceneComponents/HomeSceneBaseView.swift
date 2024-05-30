//import UIKit
//
//
//protocol HomeSceneBaseViewDelegate: AnyObject {
//    
//    func didTapHomeSceneBaseView(title: String)
//    
//}
//
//final class HomeSceneBaseView: UIView, CustomSearchDelegate {
//    
//    weak var delegate: HomeSceneBaseViewDelegate?
//    
//    
//    init(delegate: HomeSceneBaseViewDelegate?) {
//        self.delegate = delegate
//        super.init(frame: .zero)
//        setupCollectionView()
//        setupConstraints()
//        setupTapGesture()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    private let arrayMock = [
//        "Season 1",
//        "Season 2",
//        "Season 3",
//        "Season 4",
//        "Season 5",
//        "Season 6",
//        "Season 7",
//        "Season 8",
//        "Season 9",
//        "Season 10"
//        
//    ]
//    
//    private var arrayNewMock: [String] = []
//    
////    private var searchBarIsEmpty: Bool {
////        
////        get {
////            guard let text = searchController.searchBar.text else { return false }
////            return text.isEmpty
////        }
////        
////    }
//    
//    private var isFiltering: Bool {
//            return !arrayNewMock.isEmpty
//        }
//    
//    private let baseLogo: UIImageView = {
//        let baseLogo = UIImageView()
//        baseLogo.contentMode = .scaleAspectFit
//        baseLogo.image = UIImage(named: "rm_logo")
//        
//        return baseLogo
//    }()
//    
//    private let infoCollection: UICollectionView = {
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 24, height: 357)
//        let infoCollection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        
//        return infoCollection
//    }()
//    
////    private lazy var searchController: UISearchController = {
////        let searchControllerr = UISearchController(searchResultsController: nil)
////        searchControllerr.obscuresBackgroundDuringPresentation = false
////        searchControllerr.searchBar.placeholder = "Name or episode (ex.S01E01)..."
////
////        return searchControllerr
////    }()
//    
//    private lazy var customSearchView: CustomSearchView = {
//        let searchView = CustomSearchView(delegate: self)
//        searchView.layer.borderWidth = 1
//        searchView.layer.borderColor = .init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
//        searchView.layer.cornerRadius = 10
//        return searchView
//    }()
//    
//
//
//    
//    private func setupCollectionView() {
//        infoCollection.delegate = self
//        infoCollection.dataSource = self
//        infoCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//        
////        searchController.searchResultsUpdater = self
//        if let parentVC = delegate as? UIViewController {
////            parentVC.navigationItem.searchController = searchController
//            
//            parentVC.definesPresentationContext = true
//        }
//    }
//    
//    func setupConstraints() {
//        
//        backgroundColor = .white
//        addSubview(baseLogo)
//        addSubview(infoCollection)
//        addSubview(customSearchView)
//
//        baseLogo.snp.makeConstraints {
//            
//            $0.horizontalEdges.equalToSuperview().inset(24)
//            $0.top.equalToSuperview().offset(57)
//            $0.height.equalTo(104)
//            $0.width.equalTo(312)
//            
//        }
//        
//        
//        customSearchView.snp.makeConstraints {
//                    $0.top.equalTo(baseLogo.snp.bottom).offset(20)
//                    $0.leading.trailing.equalToSuperview().inset(24)
//                    $0.height.equalTo(56)
//                }
//        
//        infoCollection.snp.makeConstraints {
//            
//            $0.top.equalToSuperview().offset(382)
//            $0.horizontalEdges.equalToSuperview().inset(24)
//            $0.bottom.equalToSuperview().offset(-85)
//            
//        }
//        
//        
//        
//        
//        
//    }
//    
//    func search(query: String) {
//            arrayNewMock = arrayMock.filter { $0.lowercased().contains(query.lowercased()) }
//            infoCollection.reloadData()
//        }
//    
//    private func setupTapGesture() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        tapGesture.cancelsTouchesInView = false
//        self.addGestureRecognizer(tapGesture)
//    }
//    
//    @objc private func handleTap() {
//        self.endEditing(true) // Hide the keyboard
//    }
//    
//    }
//
//
//    
//
//
//extension HomeSceneBaseView: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//        if isFiltering {
//            return arrayNewMock.count
//        }
//        
//        return arrayMock.count
//        
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = infoCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        cell.backgroundColor = .red
//        var defaultConfigure = UIListContentConfiguration.cell()
//        
//        var array: String
//        
//        if isFiltering {
//            array = arrayNewMock[indexPath.item]
//        } else {
//            array = arrayMock[indexPath.item]
//        }
//        
//        defaultConfigure.text = "Cell - \(array)"
//        cell.contentConfiguration = defaultConfigure
//        
//        return cell
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        
//        let selectedTitle = isFiltering ? arrayNewMock[indexPath.item] : arrayMock[indexPath.item]
//        delegate?.didTapHomeSceneBaseView(title: selectedTitle)
//        
//    }
//    
//}
//
//extension HomeSceneBaseView: UISearchResultsUpdating {
//    
//    
//    func updateSearchResults(for searchController: UISearchController) {
//        
//        let text = searchController.searchBar.text
//        guard let text else { return }
//        
//        filterContentForSearchText(text)
//        
//    }
//    
//    private func filterContentForSearchText(_ searchText: String) {
//        
//        arrayNewMock = arrayMock.filter({ season in
//            return season.lowercased().contains(searchText.lowercased())
//        })
//        
//        infoCollection.reloadData()
//        
//    }
//    
//}

//import UIKit
//
//protocol HomeSceneBaseViewDelegate: AnyObject {
//    func didTapHomeSceneBaseView(title: String)
//}
//
//final class HomeSceneBaseView: UIView, CustomSearchDelegate {
//    
//    weak var delegate: HomeSceneBaseViewDelegate?
//    
//    init(delegate: HomeSceneBaseViewDelegate?) {
//        self.delegate = delegate
//        super.init(frame: .zero)
//        setupCollectionView()
//        setupConstraints()
//        setupTapGesture()
//        arrayNewMock = arrayMock
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private let arrayMock = [
//        "Season 1", "Season 2", "Season 3", "Season 4",
//        "Season 5", "Season 6", "Season 7", "Season 8",
//        "Season 9", "Season 10"
//    ]
//    
//    private var arrayNewMock: [String] = []
//    
//    private let baseLogo: UIImageView = {
//        let baseLogo = UIImageView()
//        baseLogo.contentMode = .scaleAspectFit
//        baseLogo.image = UIImage(named: "rm_logo")
//        return baseLogo
//    }()
//    
//    private let infoCollection: UICollectionView = {
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 24, height: 357)
//        let infoCollection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        return infoCollection
//    }()
//    
//    private lazy var customSearchView: CustomSearchView = {
//        let searchView = CustomSearchView(delegate: self)
//        searchView.layer.borderWidth = 1
//        searchView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
//        searchView.layer.cornerRadius = 10
//        return searchView
//    }()
//    
//    private func setupCollectionView() {
//        infoCollection.delegate = self
//        infoCollection.dataSource = self
//        infoCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//    }
//    
//    private func setupConstraints() {
//        backgroundColor = .white
//        addSubview(baseLogo)
//        addSubview(infoCollection)
//        addSubview(customSearchView)
//        
//        baseLogo.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview().inset(24)
//            make.top.equalToSuperview().offset(57)
//            make.height.equalTo(104)
//            make.width.equalTo(312)
//        }
//        
//        customSearchView.snp.makeConstraints { make in
//            make.top.equalTo(baseLogo.snp.bottom).offset(20)
//            make.horizontalEdges.equalToSuperview().inset(24)
//            make.height.equalTo(56)
//        }
//        
//        infoCollection.snp.makeConstraints { make in
//            make.top.equalTo(customSearchView.snp.bottom).offset(20)
//            make.horizontalEdges.equalToSuperview().inset(24)
//            make.bottom.equalToSuperview().offset(-85)
//        }
//    }
//    
//    private func setupTapGesture() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        tapGesture.cancelsTouchesInView = false
//        addGestureRecognizer(tapGesture)
//    }
//    
//    @objc private func handleTap() {
//        endEditing(true) // Hide the keyboard
//    }
//    
//    // MARK: - CustomSearchDelegate
//    
//    func search(query: String) {
//        arrayNewMock = arrayMock.filter { $0.lowercased().contains(query.lowercased()) }
//        infoCollection.reloadData()
//    }
//    
//    func searchCancelled() {
//        arrayNewMock = arrayMock
//        infoCollection.reloadData()
//    }
//}
//
//extension HomeSceneBaseView: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return arrayNewMock.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = infoCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        cell.backgroundColor = .red
//        var defaultConfigure = UIListContentConfiguration.cell()
//        defaultConfigure.text = "Cell - \(arrayNewMock[indexPath.item])"
//        cell.contentConfiguration = defaultConfigure
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedTitle = arrayNewMock[indexPath.item]
//        delegate?.didTapHomeSceneBaseView(title: selectedTitle)
//    }
//}
//
//
//import UIKit
//
//protocol HomeSceneBaseViewDelegate: AnyObject {
//    func didTapHomeSceneBaseView(title: String)
//}
//
//final class HomeSceneBaseView: UIView, CustomSearchDelegate {
//    
//    weak var delegate: HomeSceneBaseViewDelegate?
//    
//    init(delegate: HomeSceneBaseViewDelegate?) {
//        self.delegate = delegate
//        super.init(frame: .zero)
//        setupCollectionView()
//        setupConstraints()
//        setupTapGesture()
//        arrayNewMock = arrayMock
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private let arrayMock = [
//        "Season 1", "Season 2", "Season 3", "Season 4",
//        "Season 5", "Season 6", "Season 7", "Season 8",
//        "Season 9", "Season 10"
//    ]
//    
//    private var arrayNewMock: [String] = []
//    
//    private let baseLogo: UIImageView = {
//        let baseLogo = UIImageView()
//        baseLogo.contentMode = .scaleAspectFit
//        baseLogo.image = UIImage(named: "rm_logo")
//        return baseLogo
//    }()
//    
//    private let infoCollection: UICollectionView = {
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 24, height: 357)
//        let infoCollection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        return infoCollection
//    }()
//    
//    private lazy var customSearchView: CustomSearchView = {
//        let searchView = CustomSearchView(delegate: self)
//        searchView.layer.borderWidth = 1
//        searchView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
//        searchView.layer.cornerRadius = 10
//        return searchView
//    }()
//    
//    private func setupCollectionView() {
//        infoCollection.delegate = self
//        infoCollection.dataSource = self
//        infoCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//    }
//    
//    private func setupConstraints() {
//        backgroundColor = .white
//        addSubview(baseLogo)
//        addSubview(infoCollection)
//        addSubview(customSearchView)
//        
//        baseLogo.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview().inset(24)
//            make.top.equalToSuperview().offset(57)
//            make.height.equalTo(104)
//            make.width.equalTo(312)
//        }
//        
//        customSearchView.snp.makeConstraints { make in
//            make.top.equalTo(baseLogo.snp.bottom).offset(20)
//            make.horizontalEdges.equalToSuperview().inset(24)
//            make.height.equalTo(56)
//        }
//        
//        infoCollection.snp.makeConstraints { make in
//            make.top.equalTo(customSearchView.snp.bottom).offset(20)
//            make.horizontalEdges.equalToSuperview().inset(24)
//            make.bottom.equalToSuperview().offset(-85)
//        }
//    }
//    
//    private func setupTapGesture() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        tapGesture.cancelsTouchesInView = false
//        addGestureRecognizer(tapGesture)
//    }
//    
//    @objc private func handleTap() {
//        endEditing(true) // Hide the keyboard
//    }
//    
//    // MARK: - CustomSearchDelegate
//    
//    func search(query: String) {
//        arrayNewMock = arrayMock.filter { $0.lowercased().contains(query.lowercased()) }
//        infoCollection.reloadData()
//    }
//    
//    func searchCancelled() {
//        arrayNewMock = arrayMock
//        infoCollection.reloadData()
//    }
//}
//
//extension HomeSceneBaseView: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return arrayNewMock.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = infoCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        cell.backgroundColor = .red
//        var defaultConfigure = UIListContentConfiguration.cell()
//        defaultConfigure.text = "Cell - \(arrayNewMock[indexPath.item])"
//        cell.contentConfiguration = defaultConfigure
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedTitle = arrayNewMock[indexPath.item]
//        delegate?.didTapHomeSceneBaseView(title: selectedTitle)
//    }
//}
import UIKit

protocol HomeSceneBaseViewDelegate: AnyObject {
    func didTapHomeSceneBaseView(title: String)
}

final class HomeSceneBaseView: UIView, CustomSearchDelegate {
    
    weak var delegate: HomeSceneBaseViewDelegate?
    
    init(delegate: HomeSceneBaseViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupCollectionView()
        setupConstraints()
        setupTapGesture()
        arrayNewMock = arrayMock
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let arrayMock = [
        "Season 1", "Season 2", "Season 3", "Season 4",
        "Season 5", "Season 6", "Season 7", "Season 8",
        "Season 9", "Season 10"
    ]
    
    private var arrayNewMock: [String] = []
    
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
    
    private lazy var customSearchView: CustomSearchView = {
        let searchView = CustomSearchView(delegate: self)
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        searchView.layer.cornerRadius = 10
        return searchView
    }()
    
    private func setupCollectionView() {
        infoCollection.delegate = self
        infoCollection.dataSource = self
        infoCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    private func setupConstraints() {
        backgroundColor = .white
        addSubview(baseLogo)
        addSubview(infoCollection)
        addSubview(customSearchView)
        
        baseLogo.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().offset(57)
            make.height.equalTo(104)
            make.width.equalTo(312)
        }
        
        customSearchView.snp.makeConstraints { make in
            make.top.equalTo(baseLogo.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        infoCollection.snp.makeConstraints { make in
            make.top.equalTo(customSearchView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().offset(-85)
        }
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        endEditing(true) // Hide the keyboard
        infoCollection.reloadData()
    }
    
    // MARK: - CustomSearchDelegate
    
    func search(query: String) {
        if query.isEmpty {
            arrayNewMock = arrayMock
        } else {
            arrayNewMock = arrayMock.filter { $0.lowercased().contains(query.lowercased()) }
        }
        infoCollection.reloadData()
    }
    
    func searchCancelled() {
        arrayNewMock = arrayMock
        infoCollection.reloadData()
    }
}

extension HomeSceneBaseView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayNewMock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = infoCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .red
        var defaultConfigure = UIListContentConfiguration.cell()
        defaultConfigure.text = "Cell - \(arrayNewMock[indexPath.item])"
        cell.contentConfiguration = defaultConfigure
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedTitle = arrayNewMock[indexPath.item]
        delegate?.didTapHomeSceneBaseView(title: selectedTitle)
    }
}
