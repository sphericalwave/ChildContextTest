//
//  SceneDelegate.swift
//  ChildContextTest
//
//  Created by Aaron Anthony on 2020-09-21.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate
{
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let absFd = AbsFd(name: "Test AbsFd", moc: context)
        let absFdUI = AbsFdUI(absFd: absFd).environment(\.managedObjectContext, context)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: absFdUI)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

