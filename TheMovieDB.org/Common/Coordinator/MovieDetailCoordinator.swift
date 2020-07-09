
import UIKit
import ImageSlideshow

protocol MovieDetailCoordinatorDelegate: class {
    func didPress(of movieModel: MovieDetailModel?, from viewController: UIViewController)
}

class MovieDetailCoordinator: Coordinator {
    
    //MARK: - Properties
    private var rootViewController  : UINavigationController?
    private var movieModel          : MovieModel?
    
    //MARK: - Init
    init(rootViewController: UIViewController, movieModel: MovieModel?) {
        self.rootViewController = rootViewController.navigationController
        self.movieModel = movieModel
    }

    func start() {
        guard let model = movieModel else { return }
        let vc = MovieDetailController(viewModel: MovieDetailViewModel(apiClient: MovieDetailApiClient(), movie: model))
        vc.delegate = self
        rootViewController?.pushViewController(vc, animated: true)
    }
    
}

extension MovieDetailCoordinator: MovieDetailCoordinatorDelegate {

    //MARK: - Delegate
    func didPress(of movieModel: MovieDetailModel?, from viewController: UIViewController) {
        guard let model = movieModel else { return }
//        switch item {
//        case .location:
////            let vc = MapViewController(firmModel: model)
////            vc.title = model.firm.name
////            viewController.navigationController?.pushViewController(vc, animated: true)
//            break
//        case .instagram:
//            guard let url = URL(string: "https://www.instagram.com/" + model.firm.instagramProfile) else { return }
//            UIApplication.shared.open(url)
//        case .call:
//            showPhoneNumbers(controller: viewController, numbers: model.firm.phoneNumbers)
//        }
    }
}

extension MovieDetailCoordinator {
    
    //MARK: - Helper
    private func showPhoneNumbers(controller: UIViewController,numbers: [String]) {
        
        if numbers.count > 1 {
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
            numbers.forEach { (number) in
                let phone = UIAlertAction(title: number, style: .default) { (action) in
                    self.call(number: number)
                }
                actionSheet.addAction(phone)
            }
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            actionSheet.addAction(cancelAction)
            controller.present(actionSheet, animated: true, completion: nil)
        } else {
            self.call(number: numbers.first)
        }
    }
    
    private func call(number: String?) {
        guard let number = number else { return }
        let phoneNumber = number.removingWhitespaces().replacingOccurrences(of: "[+()-]", with: "", options: [.regularExpression, .caseInsensitive])
        if let url = URL(string: "tel://\(phoneNumber)") {
            UIApplication.shared.open(url)
        }
    }
    
}
