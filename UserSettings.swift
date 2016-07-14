
import UIKit

class UserSettings: NSObject {
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
    
    override init(){
        self.party = true
        self.weekend = true
        self.chill = true
        self.work = true
        self.male = true
        self.female = false
        self.hairDark = false
        self.hairBright = true
        self.skinDark = false
        self.skinBright = true
    }
    
}
