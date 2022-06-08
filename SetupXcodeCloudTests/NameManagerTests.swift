import XCTest
@testable import SetupXcodeCloud

final class NameManagerTests: XCTestCase {

    private var sut: NameManager!
    private var userDefaultsMock: UserDefaultsMock!

    override func setUpWithError() throws {
        userDefaultsMock = UserDefaultsMock()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInit() {
        userDefaultsMock.stringForKeyReturnValue = "John Appleseed"

        sut = NameManager(userDefaults: userDefaultsMock)
        XCTAssertEqual(sut.usersName, "John Appleseed")
    }

    func testSetName() {
        sut = NameManager(userDefaults: userDefaultsMock)
        sut.setName("John Appleseed")

        XCTAssertEqual(sut.usersName, "John Appleseed")
        XCTAssertEqual(userDefaultsMock.setValueForKeyInvokeCount, 1)
        XCTAssertEqual(userDefaultsMock.setValueForKeyKey, "user_name")
        XCTAssertEqual(userDefaultsMock.setValueForKeyValue as? String, "John Appleseed")
    }
}
