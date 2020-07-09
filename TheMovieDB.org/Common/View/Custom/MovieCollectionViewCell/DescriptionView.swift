
import UIKit

class DescriptionView: UIImageView {
    
    //MARK: - Properties
    private lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.textColor = Global.grayColor().withAlphaComponent(0.8)
        label.font = Global.regularFont(size: 14.width)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = false
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

extension DescriptionView {
    
    //MARK: - Configure
    func configure(item: MovieModel) {
        self.titleLbl.text = item.title
    }
    
    //MARK: - Setup
    private func setUp() {
        self.addSubviews([titleLbl])
        titleLbl.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview().inset(4.width)
        }
    }
}
