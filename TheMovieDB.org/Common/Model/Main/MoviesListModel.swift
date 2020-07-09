
import Foundation
import UIKit

class MoviesListModel: Codable {

   var page: Int // 1,
   var total_results: Int //10000,
   var total_pages: Int //500,
   var results: [MovieModel]
    
}

class MovieModel : Codable {
    let popularity : Double?
    let voteCount : Int?
    let video : Bool?
    let posterPath : String?
    let id : Int
    let adult : Bool?
    let backdropPath : String?
    let originalLanguage : String?
    let originalTitle : String?
    let genreIds : [Int]?
    let title : String?
    let voteAverage : Double?
    let overview : String?
    let releaseDate : String?

    enum CodingKeys: String, CodingKey {

        case popularity, video, id, adult, title, overview
        
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIds = "genre_ids"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }


}


//class HomeModel: Codable {
//
//    let recommendedFirms   :[FirmModel]
//    let popularFirms       :[FirmModel]
//    let recentlyAddedFirms :[FirmModel]
//    let masters            :[FirmModel]
//}
//
struct FirmModel: Codable {

    let id: Int
    let type: String
    let name: String
    let address: String
    let checkRating: Int
    let avatar: String
    let workSchedule: String
    let picture: String
    let averageRating: Float
    let cashback: String?
    let todayReservationsCount: Int?

    enum CodingKeys: String,CodingKey {
        case id,name,address,checkRating,workSchedule,averageRating,todayReservationsCount,type
        case avatar = "avatarUrl"
        case picture = "pictureUrl"
        case cashback = "prepaymentCashbackAmount"
    }
}
