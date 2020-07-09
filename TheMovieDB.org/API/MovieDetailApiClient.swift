import Foundation

struct MovieDetailApiClient: MovieDetailApiProtocol {
    var session: URLSession = URLSession(configuration: .default)
    
    func movie(endPoint: MainEndPoint, complition: @escaping (Result<FirmDetailModel, NetworkError>) -> Void) {
        fetch(with: endPoint.request, completion: complition)
    }
}
