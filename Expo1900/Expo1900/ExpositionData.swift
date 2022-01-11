import Foundation

struct ExpositionData: Codable {
    let title: String
    let visitorsCount: Int
    let location: String
    let duration: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case visitorsCount
        case location
        case duration
        case description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.visitorsCount = try container.decode(Int.self, forKey: .visitorsCount)
        self.location = try container.decode(String.self, forKey: .location)
        self.duration = try container.decode(String.self, forKey: .duration)
        self.description = try container.decode(String.self, forKey: .description)
    }
}
