
import Foundation

// MARK: - MovieDetailModel
class MovieDetailModel: Codable {
    let backdropPath: String?
    let id: Int
    let imdbID, overview: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case imdbID = "imdb_id"
        case overview
        case title
    }
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    let id: Int
    let name, posterPath, backdropPath: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

//// MARK: - ProductionCountry
//struct ProductionCountry: Codable {
//    let iso3166_1, name: String
//
//    enum CodingKeys: String, CodingKey {
//        case iso3166_1 = "iso_3166_1"
//        case name
//    }
//}





class FirmDetailModel: Codable {
    var firm: Firm
    let masters:[Master]
    let services:[Service]
    let location: Location
    var schedule = ScheduleModel()
    var showAllServices = false
    
    enum CodingKeys: String,CodingKey {
        case firm,masters,services,location
    }
}

class Firm: Codable {
    let id: Int
    let name: String
    let address: String
    let workStartTime: String
    let workEndTime: String
    let type: String
    let checkRating: Int
    let instagramProfile: String
    let avatarUrl: String
    let phoneNumbers:[String]
    let pictures: [String]
    let todayReservationsCount: Int?
    var averageRating: Double?
    let prepaymentCashbackAmount: String?
}

class Master: Codable {
    let name: String
    let surname: String
    let profession: String
    let serviceIds:[Int]
    let avatarUrl: String
    let rating: Float
}

class Service: Codable {
    let id: Int
    let name: String
    let priceStr: String
    let duration: Int
    var inBasket = false
    enum CodingKeys: String,CodingKey {
        case id,name,priceStr,duration
    }
}

class Location: Codable {
    let markerX: Double
    let markerY: Double
    let centerX: Double
    let centerY: Double
}
