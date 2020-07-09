
import Foundation
import UIKit

enum MovieDetailSections: Int, CaseCountable {
    
    case title,overview
    
    func numberOfItems(model: MovieDetailModel,showAll: Bool) -> Int {
        switch self {
        case .title, .overview:
            return 1
        }
    }
    
    var sectionHeader : MovieDetalHeaderSectionView {
        return MovieDetalHeaderSectionView(type: self)
    }
    
    var sectionHeaderHeight: CGFloat {
        switch self {
        case .title:
            return UITableView.automaticDimension
        case .overview:
            return 20.width
        default:
            return 0
        }
    }
    
    var title: String? {
        switch self {
        case .title:
            return "Название"
        case .overview:
            return "Описание"
//        default:
//            return nil
        }
    }
    
}
