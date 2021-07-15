//
//  RegistrationUITest.swift
//  iOSTestingUITests
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import XCTest

class RegistrationUITest:XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }
    
    
    func testAllRequireFieldsMessageWhenClickRegisterButton() {
        let fullName = "Kyaw Khine"
        let phoneNumber = "09423696548"

        let nameErrorMessage = "Fullname is empty!"
        let phoneNumberMessage = "PhoneNumber is empty!"
        let passwordMessage = "Password is empty!"

        app.buttons["Register"].tap()
        XCTAssert(app.alerts.staticTexts[nameErrorMessage].exists,"Your fullname's error message was wrong!")

        app.textFields["fullName"].tap()
        app.textFields["fullName"].typeText(fullName)
        app.buttons["Register"].tap()
        XCTAssert(app.alerts.staticTexts[phoneNumberMessage].exists,"Your phone number's error message was wrong!")

        app.textFields["fullName"].tap()
        app.textFields["fullName"].doubleTap()
        app.menuItems["Cut"].tap()
        app.textFields["fullName"].typeText(fullName)

        app.textFields["phoneNumber"].tap()
        app.textFields["phoneNumber"].typeText(phoneNumber)

        app.buttons["Register"].tap()
        XCTAssert(app.alerts.staticTexts[passwordMessage].exists,"Your password's error message was wrong!")
    }
    
    
    func testAlreadyRegisterAccountWhenClickRegisterButton() {
        let fullName = "Kyaw Khine"
        let phoneNumber = "09423696548"
        let password = "Admin@123"
        let alreadyRegisterPhoneMessage =
                    "This number is already registered with an existing account. Please login with your number or register with a different one."
                
        app.textFields["fullName"].tap()
        app.textFields["fullName"].typeText(fullName)
        app.textFields["phoneNumber"].tap()
        app.textFields["phoneNumber"].typeText(phoneNumber)
        app.secureTextFields["userPassword"].tap()
        app.secureTextFields["userPassword"].typeText(password)
        
        app.buttons["Register"].tap()
        XCTAssertTrue(app.alerts.staticTexts[alreadyRegisterPhoneMessage].waitForExistence(timeout: 7),"Your error message is wrong")
    }
    
    func testRegisterNewAccountWhenClickRegisterButton() {
        let fullName = "Kyaw Khine"
        let phoneNumber = "09423444444"
        let password = "Admin@123"
        let expectedGreeting = "Hi , "+fullName
        let expectedMessage = "We will call to your number : "+phoneNumber

        app.textFields["fullName"].tap()
        app.textFields["fullName"].typeText(fullName)
        app.textFields["phoneNumber"].tap()
        app.textFields["phoneNumber"].typeText(phoneNumber)
        app.secureTextFields["userPassword"].tap()
        app.secureTextFields["userPassword"].typeText(password)
        app.buttons["Register"].tap()


        XCTAssertTrue(app.staticTexts[expectedGreeting].waitForExistence(timeout: 7),"Greeting name is wrong")
        XCTAssertTrue(app.staticTexts[expectedMessage].waitForExistence(timeout: 7),"Greeting message is wrong")
    }
    
}
