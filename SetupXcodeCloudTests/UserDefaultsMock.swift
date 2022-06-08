import Foundation

class UserDefaultsMock: UserDefaults {
    var stringForKeyInvokeCount = 0
    var stringForKeyKey: String?
    var stringForKeyReturnValue: String?

    var setValueForKeyInvokeCount = 0
    var setValueForKeyValue: Any?
    var setValueForKeyKey: String?

    override func string(forKey defaultName: String) -> String? {
        stringForKeyInvokeCount += 1
        stringForKeyKey = defaultName
        return stringForKeyReturnValue
    }

    override func set(_ value: Any?, forKey defaultName: String) {
        setValueForKeyInvokeCount += 1
        setValueForKeyValue = value
        setValueForKeyKey = defaultName
    }
}
