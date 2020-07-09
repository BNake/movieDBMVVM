
import UIKit
import Kingfisher

class MovieImageView: UIImageView {
    
    //MARK: - Properties
    private lazy var cashBackLabel:PaddingLabel = {
        let label = PaddingLabel(withInsets: 5, 5, 8, 8)
        label.font = Global.regularFont(size: 14.width)
        label.textColor = .white
        label.layer.cornerRadius = 4
        label.clipsToBounds = true
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieImageView {
    
    //MARK: - Configure
    func configure(item: MovieModel) {
        guard let posterPath = item.posterPath else {
            return
        }
        self.kf.indicatorType = .activity
        guard let image = URL(string: Global.domenImage() + posterPath) else { return }
        self.kf.setImage(with: image)
    }
    
    //MARK: - Setup
    private func setUp() {
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        self.addSubview(cashBackLabel)
        cashBackLabel.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview().offset(-8.width)
        }
    }
}
