//
//  SceneDelegate.swift
//  SBGWidget
//
//  Created by Ryan Hill on 21/02/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            handleURL(url)
        }
//        guard let urlToOpen = URLContexts.first?.url else { return }
//
//        handleURL(urlToOpen)
    }

    func handleURL(_ url: URL) {
      guard url.pathComponents.count >= 2 else {
          print("component count \(url.pathComponents.count)")
          return }
        for component in url.pathComponents {
            print("\(component)")
        }

      let section = url.pathComponents[1]
      let detail = url.pathComponents[2]

      switch section {
      case "betslip":
        guard let id = Int(detail) else { break }
          navigateToMockBetslip(id)
      default: break
      }
    }

    func navigateToMockBetslip(_ id: Int) {
      // 1
      guard let rootController = window?.rootViewController else {
        return
      }

      // 2
//      guard let viewControllers = tabBarController.viewControllers,
//        let listIndex = viewControllers.firstIndex(where: { $0 is ListNavigationController }),
//        let listViewController = viewControllers[listIndex] as? ListNavigationController else { return }

      // 3
//        rootController.popToRootViewController(animated: false)
//      tabBarController.selectedIndex = listIndex

      // 4
      let mockBetslipViewController = MockBetSlipViewController()
      rootController.present(mockBetslipViewController, animated: true)
    }
}

