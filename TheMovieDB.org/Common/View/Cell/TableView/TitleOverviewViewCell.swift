
import UIKit

class TitleOverviewViewCell: UITableViewCell {
    
    //MARK: - Properties
    static let identifier       = "TitleOverviewViewCell"
    private var model           : ScheduleModel?

    
    private lazy var title: PaddingLabel = {
        let label = PaddingLabel(withInsets: 8.width, 8.width, 5.width, 5.width)
        label.font = Global.boldFont(size: 14.width)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.layer.cornerRadius = 4
        label.clipsToBounds = true
        label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.3670537243)
        return label
    }()
   
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TitleOverviewViewCell {
    //MARK: - Configure
    func configure(model: MovieDetailModel?,index: Int) {
        guard let model = model else { return }
        if index == 0 {
            title.text = model.title
        } else {
            title.text = model.overview
        }
    }
   
    //MARK: - Set up
    private func setUpViews() {
        self.backgroundColor = .white
        self.selectionStyle = .none
        self.addSubviews([title])
        title.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16.width)
            make.top.equalToSuperview().offset(8.width)
            make.bottom.equalToSuperview().offset(-8.width)
        }
    }

}
