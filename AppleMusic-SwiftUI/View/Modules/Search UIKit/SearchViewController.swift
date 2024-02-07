import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Your Library"
        return searchController
    }()
    
    private lazy var browseCategoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Browse Categories"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
        collection.delegate = self
        collection.dataSource = self
        collection.isScrollEnabled = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        overrideUserInterfaceStyle = .dark
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
    }
    
    private func setupHierarchy() {
        let views = [browseCategoriesLabel, collectionView]
        views.forEach { scrollView.addSubview($0) }
        view.addSubview(scrollView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            browseCategoriesLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            browseCategoriesLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            browseCategoriesLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: browseCategoriesLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -30),
            collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 980)
        ])
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.48), heightDimension: .estimated(120))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(150))
            let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
            layoutGroup.interItemSpacing = .fixed(14)

            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.interGroupSpacing = 10

            return layoutSection
        }
    }
}

// MARK: - Extensions

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RadioModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: indexPath) as? SearchCell else { return UICollectionViewCell() }
        cell.configuration(model: RadioModel.categories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let detailView = HostingViewController()
        
        if let navigator = navigationController {
            navigator.pushViewController(detailView, animated: true)
        }
    }
}
