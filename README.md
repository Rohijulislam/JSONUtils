# JSONUtils

[![Swift](https://img.shields.io/badge/Swift-5.0%2B-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/badge/platforms-iOS%20|%20macOS%20|%20tvOS-lightgrey.svg)](https://developer.apple.com/swift)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](#license)

A lightweight and developer-friendly Swift utility for encoding, decoding, and converting JSON with powerful debug support.

---

## ✨ Features

- Convert `Dictionary` or `NSDictionary` to JSON string.
- Convert JSON string to `Dictionary` or `NSDictionary`.
- Encode any `Encodable` object to JSON string or data.
- Decode any JSON string or data to a `Decodable` object.
- Objective-C compatible methods for interoperability.
- Debug-friendly logs with emoji for easy inspection.

---

## 📦 Installation

### Swift Package Manager (SPM)

Add this to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/Rohijulislam/JSONUtils.git", from: "main")
```


Then add "JSONUtils" to your target's dependencies.

##  🧩 Objective-C Support

- Supports bridging with Objective-C through:
- jsonStringFromDictionary: – Converts NSDictionary to NSString.
- dictionaryFrom: – Converts NSString to NSDictionary.
- jsonStringFromData: – Converts NSData to NSString.

## 📄 License

MIT License. See the [LICENSE](https://github.com/Rohijulislam/JSONUtils/blob/main/LICENSE) file for full details.



