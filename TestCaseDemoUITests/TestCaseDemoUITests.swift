//
//  TestCaseDemoUITests.swift
//  TestCaseDemoUITests
//
//  Created by CodeCat15 on 12/24/20.
//

import XCTest

class TestCaseDemoUITests: XCTestCase {
    
    
    struct AccessibilityIdentifier {
          static let loginScreen = "loginScreen"
          static let emailTextField = "txtEmail"
          static let passwordTextField = "txtPassword"
          static let loginButton = "btnLogin"
          static let welcomeScreen = "welcomeScreen"
      }
    
    
    struct TestFailureMessage {
           static let loginScreenNotDisplayed = "Login screen is not displayed."
           static let emailTextFieldNotFound = "Email text field is not found."
           static let passwordTextFieldNotFound = "Password text field is not found."
           static let loginButtonNotFound = "Login button is not found."
           static let loginNotSuccessful = "Login is not successful. Welcome screen is not displayed."
       }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        let app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testLoginSuccessFlow() throws {
           let app = XCUIApplication()

           // Step 1: Check that the login screen is displayed.
           XCTAssertTrue(app.otherElements[AccessibilityIdentifier.loginScreen].exists, TestFailureMessage.loginScreenNotDisplayed)

           // Step 2: Check email field is exists then click on email textfield and enter a valid email.
           let emailTextField = app.textFields[AccessibilityIdentifier.emailTextField]
           XCTAssertTrue(emailTextField.exists, TestFailureMessage.emailTextFieldNotFound)
           emailTextField.tap()
           emailTextField.typeText("testuser@grr.la")

           // Step 3: Check password field is exists then click on password textfield and enter associated password.
           let passwordTextField = app.secureTextFields[AccessibilityIdentifier.passwordTextField]
           XCTAssertTrue(passwordTextField.exists, TestFailureMessage.passwordTextFieldNotFound)
           passwordTextField.tap()
           passwordTextField.typeText("Test@123")

           // Step 4: Check login button is exists then click on button to go to the welcome screen
           let loginButton = app.buttons[AccessibilityIdentifier.loginButton]
           XCTAssertTrue(loginButton.exists, TestFailureMessage.loginButtonNotFound)
           loginButton.tap()

           // Step 5: Verify that the application navigates to the welcome screen.
           XCTAssertTrue(app.otherElements[AccessibilityIdentifier.welcomeScreen].exists, TestFailureMessage.loginNotSuccessful)
           
       }
    
    
//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
