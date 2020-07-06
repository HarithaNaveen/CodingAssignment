//
//  SceneDelegate.swift
//  CatSpace
//
//  Created by 909547 on 03/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        CoreDataStack.shared.saveChanges()
    }

}
