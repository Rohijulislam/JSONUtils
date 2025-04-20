import Foundation

@objc(JSONUtils)
public final class JSONUtils: NSObject {
    
    // MARK: - Dictionary to JSON String
    
    /// Converts an `NSDictionary` to a JSON string.
    /// - Parameter dictionary: The NSDictionary to convert.
    /// - Returns: A  JSON string if successful, otherwise `nil`.
    @objc(jsonStringFromDictionary:)
    public static func jsonString(from dictionary: NSDictionary) -> NSString? {
        return jsonString(from: dictionary as? [String: Any])
    }
    
    /// Converts a `[String: Any]` dictionary to a JSON string.
    /// - Parameter dictionary: The dictionary to convert.
    /// - Returns: A JSON string if successful, otherwise `nil`.
    public static func jsonString(from dictionary: [String: Any]?) -> NSString? {
        guard let dictionary = dictionary,
              JSONSerialization.isValidJSONObject(dictionary) else {
            debugPrint("❌ Invalid JSON object: \(String(describing: dictionary))")
            return nil
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: [.prettyPrinted])
            return jsonString(from: data)
        } catch {
            debugPrint("❌ JSON serialization error: \(error.localizedDescription)")
            return nil
        }
    }
    
    // MARK: - JSON String to Dictionary
    
    /// Converts a JSON string (`NSString`) to an `NSDictionary`.
    /// - Parameter jsonString: The JSON string to convert.
    /// - Returns: An `NSDictionary` if successful, otherwise `nil`.
    @objc public static func dictionary(from jsonString: NSString) -> NSDictionary? {
        return dictionary(from: jsonString as String) as NSDictionary?
    }
    
    /// Converts a JSON string (`String`) to a `[String: Any]` dictionary.
    /// - Parameter jsonString: The JSON string to convert.
    /// - Returns: A `[String: Any]` dictionary if successful, otherwise `nil`.
    public static func dictionary(from jsonString: String) -> [String: Any]? {
        guard let data = jsonString.data(using: .utf8) else {
            debugPrint("❌ Failed to convert string to data")
            return nil
        }
        
        do {
            let object = try JSONSerialization.jsonObject(with: data, options: [])
            return object as? [String: Any]
        } catch {
            debugPrint("❌ JSON deserialization error: \(error.localizedDescription)")
            return nil
        }
    }
    
    // MARK: - Data to JSON String
    
    /// Converts raw `Data` to a JSON string.
    /// - Parameter data: The JSON data to convert.
    /// - Returns: A UTF-8 encoded JSON string if successful, otherwise `nil`.
    @objc(jsonStringFromData:)
    public static func jsonString(from data: Data) -> NSString? {
        guard let jsonString = String(data: data, encoding: .utf8) else {
            debugPrint("❌ Failed to encode JSON data to string")
            return nil
        }
        return jsonString as NSString
    }
    
    // MARK: - Codable Support
    
    // Converts an `Encodable` object to a JSON string.
    /// - Parameter object: The object to encode.
    /// - Returns: A pretty-printed JSON string if successful, otherwise `nil`.
    public static func jsonString<T: Encodable>(from object: T) -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try encoder.encode(object)
            return String(data: data, encoding: .utf8)
        } catch {
            debugPrint("❌ Encoding error: \(error.localizedDescription)")
            return nil
        }
    }
    
    /// Decodes a JSON string into a `Decodable` object.
    /// - Parameters:
    ///   - type: The type to decode to.
    ///   - jsonString: The JSON string input.
    /// - Returns: A decoded object if successful, otherwise `nil`.
    public static func decode<T: Decodable>(_ type: T.Type, from jsonString: String) -> T? {
        guard let data = jsonString.data(using: .utf8) else {
            debugPrint("❌ Failed to convert string to data")
            return nil
        }
        
        return decode(T.self, from: data)
    }
    
    /// Converts an `Encodable` object to JSON `Data`.
    /// - Parameter object: The object to encode.
    /// - Returns: A `Data` object if successful, otherwise `nil`.
    public static func jsonData<T: Encodable>(from object: T) -> Data? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            return try encoder.encode(object)
        } catch {
            debugPrint("❌ Encoding to Data failed: \(error.localizedDescription)")
            return nil
        }
    }
    
    /// Decodes JSON `Data` into a `Decodable` object.
    /// - Parameters:
    ///   - type: The type to decode to.
    ///   - data: The JSON data input.
    /// - Returns: A decoded object if successful, otherwise `nil`.
    public static func decode<T: Decodable>(_ type: T.Type, from data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(type, from: data)
        } catch {
            debugPrint("❌ Decoding from Data failed: \(error.localizedDescription)")
            return nil
        }
    }
    
}
