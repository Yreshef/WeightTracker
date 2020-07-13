//
//  ViewController.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 29/05/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData


class ViewController: UIViewController, UITextFieldDelegate{
    
    
    // MARK: - Properties
    //=============================
    private var modelName = "WeightTracker"
    private let userName = "YohaiReshef"
    
//    private var weightFacade: WeightFacadable = WeightFacade()
    
    
    private var person: Person?
    
    // MARK: - Outlets and Action
    //=============================
    @IBOutlet private weak var weightTextField: UITextField!
    @IBOutlet private weak var commitButton: UIButton!
    
    @IBAction private func commitButton(_ sender: UIButton) {
        updateUserWeightInput()
        refreshUI()
    }
    
    // MARK: - View Life Cycle
    //=============================

    override func viewDidLoad() {
        super.viewDidLoad()
        userNotificationsAuthorisation()
        setupTextfield()
        setupCommitButton()
    }
    
    
    // MARK: - Methods
    //=============================
    
    private func updateUserWeightInput(){
        if let text = weightTextField.text {
            guard let weight = Weight(text) else {
                print("Oops, text is not convertible to float...")
                return
            }
        }
    }
    
    private func refreshUI(){
        weightTextField.text = ""
        weightTextField.resignFirstResponder()
        commitButton.isEnabled = false
    }
    
    private func setupTextfield() {
        weightTextField.delegate = self
        weightTextField.keyboardType = .numberPad
    }
    
    private func setupCommitButton() {
        commitButton.isEnabled = false
    }
    
    // MARK: - Notifications
    //=============================
    
    private var notificationTitle = "Time for your daily weighing!"
    private var notificationBody = "It's been a hard day's night"
    
    private func userNotificationsAuthorisation() {
        UNUserNotificationCenter.current().requestAuthorization(options:[.alert, .badge, .sound], completionHandler: { success, error in
            if success {
                // Do something
            } else if let error = error{
                print("Error: \(error.localizedDescription)")
            }
        })
    }
    
    private func scheduledNotification() {
        let content = UNMutableNotificationContent()
        content.title = notificationTitle
        content.sound = .default
        content.body = notificationBody
        
        let targetDate = Date().addingTimeInterval(10)
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
        let request = UNNotificationRequest(identifier: "some_ID",
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if let error = error {
                print("Something went wrong: \(error.localizedDescription)")
            }
        })
        
    }
    
    // MARK: - UITextFieldDelegate
    //=============================
    
    //Valid characters for user weight input.
    private var validCharacters = "0123456789"
    
    //Make sure the user can't input anything other than numbers in the textfield,
    //if the input is only numbers, enable the commit button.
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        // Invalid characters are all characters but the valid characters
        // specified in above.
        let invalidCharacters = CharacterSet(charactersIn: validCharacters).inverted
        
        if string.isEmpty {
            commitButton.isEnabled = false
        }else if string.rangeOfCharacter(from: invalidCharacters) == nil {
            commitButton.isEnabled = true
        }
        
        return string.rangeOfCharacter(from: invalidCharacters) == nil
    }
}

// TODO: Perhaps add user friendly error notification as an extension?
