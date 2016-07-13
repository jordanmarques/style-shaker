
import UIKit

class Post: NSObject {
    var about: String
    var tags: [String]
    var picture: String
    var thumbnail: String
    var party: Bool
    var weekend: Bool
    var chill: Bool
    var work: Bool
    var male: Bool
    var female: Bool
    var hairDark: Bool
    var hairBright: Bool
    var skinDark: Bool
    var skinBright: Bool
    var title: String
    var id: String
    
    override init(){
        self.about = "unknown"
        self.tags = []
        self.picture = "unknown"
        self.thumbnail = "unknown"
        self.party = false
        self.weekend = false
        self.chill = false
        self.work = false
        self.male = false
        self.female = false
        self.hairDark = false
        self.hairBright = false
        self.skinDark = false
        self.skinBright = false
        self.title = "unknown"
        self.id = "unknown"
    }
    
    convenience init(about: String, tags: [String], picture: String, thumbnail: String, party: Bool, weekend: Bool, chill: Bool, work: Bool, male: Bool, female: Bool, hairDark: Bool, hairBright: Bool, skinDark: Bool, skinBright: Bool, title: String, id: String){
        self.init()
        
        self.about = about
        self.tags = tags
        self.picture = picture
        self.thumbnail = thumbnail
        self.party = party
        self.weekend = weekend
        self.chill = chill
        self.work = work
        self.male = male
        self.female = female
        self.hairDark = hairDark
        self.hairBright = hairBright
        self.skinDark = skinDark
        self.skinBright = skinBright
        self.title = title
        self.id = id
    }
}
