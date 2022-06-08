import SwiftUI

enum Keys: String {
    case name = "user_name"
}

class NameManager: ObservableObject {
    @Published var usersName: String?

    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults

        usersName = userDefaults.string(forKey: Keys.name.rawValue)
    }

    func setName(_ name: String) {
        userDefaults.set(name, forKey: Keys.name.rawValue)
        usersName = name
    }
}
