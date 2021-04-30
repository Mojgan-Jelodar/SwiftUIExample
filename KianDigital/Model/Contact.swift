
import Foundation
struct Contact : Codable,Identifiable {
	let id : String?
	let name : String?
	let avatar : String?
	let family : String?
	let phoneNumber : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case avatar = "avatar"
		case family = "family"
		case phoneNumber = "phoneNumber"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
		family = try values.decodeIfPresent(String.self, forKey: .family)
		phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
	}
    
    init(id : String,
         name : String,
         family : String,
         phoneNumber : String,
         avatar : String) {
        self.name = name
        self.family = family
        self.phoneNumber = phoneNumber
        self.id = id
        self.avatar = avatar
    }
    
    var fullname: String {
        return ((self.name ?? "") + " " + (self.family ?? ""))
    }

}
