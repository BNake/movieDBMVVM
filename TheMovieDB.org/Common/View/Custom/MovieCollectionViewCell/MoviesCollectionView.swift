
import UIKit

class MoviesCollectionView: UICollectionView {
    
    //MARK: - Init
    var pullToRefresh:(() -> ())?
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MoviesCollectionView {
    
    //MARK: - Set up
    private func setUpViews() {
        self.refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(startRefreshiong), for: .valueChanged)
        self.backgroundColor = Global.backgroundColor()
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 16.width, left: 16.width, bottom: 0, right: 16.width)
        flowLayout.itemSize = CGSize(width: 160.width, height: 160.width)
        flowLayout.scrollDirection = .vertical
        self.collectionViewLayout = flowLayout
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
        self.isScrollEnabled = true
        self.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }
}

extension MoviesCollectionView {
    
    @objc private func startRefreshiong() {
        refreshControl?.beginRefreshing()
        pullToRefresh?()
    }
    
    func stopRefreshing() {
        refreshControl?.endRefreshing()
    }
}
