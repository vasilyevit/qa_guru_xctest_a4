import XCTest

final class CalculatorUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}
    
    func testWaitingWithNSPredicate() throws {
        app.launch()
        let element = app.staticTexts["%"]
        let existPledicate = NSPredicate(format: "exists == 1")
        let expection = XCTNSPredicateExpectation(predicate: existPledicate, object: element)
        wait(for: [expection], timeout: 3)
    }
    
    func testSkip() throws {
        app.launch()
        app.staticTexts["%"].tap()
        do {
            try XCTSkipIf(app.alerts["Ошибка"].exists, "Skiped")
        } catch {
            print("Catch Skip")
        }
    }

}
