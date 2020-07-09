import Foundation
import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Variable
    static let identifier             = "FirmCollectionViewCell"
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 9.width
        return view
    }()
    
    private let movieImageView         = FirmImageView(frame: .zero)
    private let descriptionView       = DescriptionView(frame: .zero)
    private let detailDescriptionView = DetailDescriptionView(frame: .zero)
    
    //MARK: - Init
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        setUpViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirmCollectionViewCell {
    
    //MARK: - Configure
    func configure(item: MovieModel) {
//        self.detailDescriptionView.configure(item: item)
        self.descriptionView.configure(item: item)
        self.movieImageView.configure(item: item)
    }
    
    //MARK: - Set up
    private func setUpViews(){
        
        self.backgroundColor = .clear
        self.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.width.bottom.top.equalToSuperview()
            make.height.equalTo(160.width)
        }
        mainView.addSubviews([movieImageView,descriptionView,detailDescriptionView])
        movieImageView.snp.makeConstraints { (make) in
            make.top.width.equalToSuperview()
            make.bottom.equalTo(self.snp.centerY).offset(10.width)
        }
        descriptionView.snp.makeConstraints { (make) in
            make.top.equalTo(movieImageView.snp.bottom)
            make.width.equalToSuperview()
        }
        detailDescriptionView.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
