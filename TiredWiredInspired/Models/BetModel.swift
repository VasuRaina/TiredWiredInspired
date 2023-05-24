
import Foundation

struct Bet: Codable, Identifiable {
    let id: String
    let sport_key: String
    let sport_title: String
    let commence_time: String
    let home_team: String
    let away_team: String
    var bookmakers: [Bookmaker]

    struct Bookmaker: Codable {
        let key: String
        let title: String
        let last_update: String
        let markets: [Market]
        var selectedAction: Int?

        struct Market: Codable {
            let key: String
            let last_update: String
            let outcomes: [Outcome]

            struct Outcome: Codable {
                let name: String
                let price: Int
            }
        }
    }
}

//struct BetS: Codable {
//    let id: String
//    let sportKey: String
//    let commenceTime: String
//    let homeTeam: String
//    let awayTeam: String
//    let bookmakers: [Bookmaker]
//
//    struct Bookmaker: Codable {
//        let key: String
//        let title: String
//        let lastUpdate: String
//        let markets: [Market]
//
//        struct Market: Codable {
//            let key: String
//            let outcomes: [Outcome]
//
//            struct Outcome: Codable {
//                let name: String
//                let price: Int
//                let point: Double?
//            }
//        }
//    }
//}
