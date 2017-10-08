
import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class ContentModel {
	public var date : String?
	public var id : Int?
	public var story_id : Int?
	public var featured : Int?
	public var image_height : Int?
	public var title : String?
	public var mosh22 : String?
	public var thumb_url : String?
	public var user_name : String?
	public var avatar : String?
	public var name : String?
	public var count : Int?
	public var url : String?
	public var share_link : String?
	public var tweet_text : String?
	public var server_time : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [ContentModel]
    {
        var models:[ContentModel] = []
        for item in array
        {
            models.append(ContentModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
	required public init?(dictionary: NSDictionary) {

		date = dictionary["date"] as? String
		id = dictionary["id"] as? Int
		story_id = dictionary["story_id"] as? Int
		featured = dictionary["featured"] as? Int
		image_height = dictionary["image_height"] as? Int
		title = dictionary["title"] as? String
		mosh22 = dictionary["mosh22"] as? String
		thumb_url = dictionary["thumb_url"] as? String
		user_name = dictionary["user_name"] as? String
		avatar = dictionary["avatar"] as? String
		name = dictionary["name"] as? String
		count = dictionary["count"] as? Int
		url = dictionary["url"] as? String
		share_link = dictionary["share_link"] as? String
		tweet_text = dictionary["tweet_text"] as? String
		server_time = dictionary["server_time"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.date, forKey: "date")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.story_id, forKey: "story_id")
		dictionary.setValue(self.featured, forKey: "featured")
		dictionary.setValue(self.image_height, forKey: "image_height")
		dictionary.setValue(self.title, forKey: "title")
		dictionary.setValue(self.mosh22, forKey: "mosh22")
		dictionary.setValue(self.thumb_url, forKey: "thumb_url")
		dictionary.setValue(self.user_name, forKey: "user_name")
		dictionary.setValue(self.avatar, forKey: "avatar")
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.count, forKey: "count")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.share_link, forKey: "share_link")
		dictionary.setValue(self.tweet_text, forKey: "tweet_text")
		dictionary.setValue(self.server_time, forKey: "server_time")

		return dictionary
	}

}
