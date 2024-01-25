import XCTest

final class CalculatorUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func testExample() throws {
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testSum() throws {
        app.launch()
        let button2 = app/*@START_MENU_TOKEN@*/.staticTexts["2"]/*[[".buttons[\"2\"].staticTexts[\"2\"]",".staticTexts[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        button2.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["+"]/*[[".buttons[\"+\"].staticTexts[\"+\"]",".staticTexts[\"+\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        button2.tap()
        app.buttons["="].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["4"].exists)
    }
    
    func testSubtracrion() throws {
        app.launch()
        let button2 = app.staticTexts["2"].firstMatch
        button2.tap()
        app.staticTexts["-"].tap()
        button2.tap()
        app.buttons["="].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["0"].exists)
    }
    
    func testDivision() throws {
        app.launch()
        let button2 = app.staticTexts["2"].firstMatch
        button2.tap()
        app.staticTexts["÷"].tap()
        button2.tap()
        app.buttons["="].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["1"].exists)
    }
    
    func testMultiplication() throws {
        app.launch()
        let button2 = app.staticTexts["2"].firstMatch
        button2.tap()
        app.staticTexts["x"].tap()
        button2.tap()
        app.buttons["="].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["4"].exists)
    }
    
    func testClear() throws {
        app.launch()
        let button2 = app.staticTexts["2"].firstMatch
        button2.tap()
        button2.tap()
        app.staticTexts["AC"].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["0"].exists)
    }
    
    func testErrorBackspace() throws {
        app.launch()
        app.buttons["backspace"].tap()
        XCTAssert(app.alerts["Ошибка"].exists)
    }
    
    func testErrorPercent() throws {
        app.launch()
        app.staticTexts["%"].tap()
        XCTAssert(app.alerts["Ошибка"].exists)
    }
    
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
