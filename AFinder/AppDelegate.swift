//
//  AppDelegate.swift
//  AFinder
//
//  Created by Daniel Tejeda on 05/02/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        var firstView: UIViewController
        
        // Check wheter or not Onboarding is available
        if let onboardingAvailable = UserDefaults.standard.object(forKey: UserPreferences.OnboardingAvailableKey) as? Bool {
            if onboardingAvailable {
                // Not the first type opening the app, but onboarding is available
                firstView = WelcomeWireFrame.createWelcomeModule()
            }
            else{
                // Onboarding not available AKA go straight to MapView
                firstView = MapWireFrame.createMapModule()
            }
        }
        else{
            // This is the first time the user opens the app
            UserDefaults.standard.set(true, forKey: UserPreferences.OnboardingAvailableKey)
            firstView = WelcomeWireFrame.createWelcomeModule()
            
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = firstView
        window?.makeKeyAndVisible()
        
        return true
    }


    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "AFinder")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

