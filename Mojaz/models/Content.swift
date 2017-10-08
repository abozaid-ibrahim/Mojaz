/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Content {
	public var story_id : Int?
	public var id : String?
	public var time_stamp : Int?
	public var user_name : String?
	public var date_time : String?
	public var media_type : String?
	public var media_url : String?
	public var png_file : String?
	public var server_time : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let content_list = Content.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Content Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Content]
    {
        var models:[Content] = []
        for item in array
        {
            models.append(Content(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let content = Content(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Content Instance.
*/
	required public init?(dictionary: NSDictionary) {

		story_id = dictionary["story_id"] as? Int
		id = dictionary["id"] as? String
		time_stamp = dictionary["time_stamp"] as? Int
		user_name = dictionary["user_name"] as? String
		date_time = dictionary["date_time"] as? String
		media_type = dictionary["media_type"] as? String
		media_url = dictionary["media_url"] as? String
		png_file = dictionary["png_file"] as? String
		server_time = dictionary["server_time"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.story_id, forKey: "story_id")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.time_stamp, forKey: "time_stamp")
		dictionary.setValue(self.user_name, forKey: "user_name")
		dictionary.setValue(self.date_time, forKey: "date_time")
		dictionary.setValue(self.media_type, forKey: "media_type")
		dictionary.setValue(self.media_url, forKey: "media_url")
		dictionary.setValue(self.png_file, forKey: "png_file")
		dictionary.setValue(self.server_time, forKey: "server_time")

		return dictionary
	}

}
enum mediaType:String{
   case images = "0" ,video = "1" ,imageAndVideo = "2"
    
}
