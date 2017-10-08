
import Foundation
 

public class category {
	public var cat_id : Int?
	public var ar_name : String?
	public var en_name : String?
	public var cat_url : String?


    public class func modelsFromDictionaryArray(array:NSArray) -> [category]
    {
        var models:[category] = []
        for item in array
        {
            models.append(category(dictionary: item as! NSDictionary)!)
        }
        return models
    }
	required public init?(dictionary: NSDictionary) {

		cat_id = dictionary["cat_id"] as? Int
		ar_name = dictionary["ar_name"] as? String
		en_name = dictionary["en_name"] as? String
		cat_url = dictionary["cat_url"] as? String
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.cat_id, forKey: "cat_id")
		dictionary.setValue(self.ar_name, forKey: "ar_name")
		dictionary.setValue(self.en_name, forKey: "en_name")
		dictionary.setValue(self.cat_url, forKey: "cat_url")

		return dictionary
	}

}
