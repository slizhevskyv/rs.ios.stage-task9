//
// 📰 🐸
// Project: RSSchool_T9
//
// Author: Uladzislau Volchyk
// On: 23.07.21
//
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("LOL, be careful, drink some water")
        }
		
		self.setupAppearance();
		
		self.window = UIWindow.init(windowScene: windowScene);
		self.window?.rootViewController = self.getRootViewController();
		
		self.window?.makeKeyAndVisible();
    }
	
	private func getRootViewController() -> UIViewController {
		let tabBarController = UITabBarController.init();
		
		let settingsVC = SettingsViewController.init();
		let itemsVC = ItemsViewController.init(withSettingsVC: settingsVC);
		
		tabBarController.viewControllers = [
			UINavigationController.init(rootViewController: itemsVC),
			UINavigationController.init(rootViewController: settingsVC),
		];

		tabBarController.tabBar.barTintColor = .white;
		
		return tabBarController;
	}
	
	private func setupAppearance() {
		print(UIFont.fontNames(forFamilyName: "Rockwell"));
		
		// UITabBar Appearance
		UITabBar.appearance().tintColor = UIColor.init(named: "Red");
		UITabBarItem.appearance().setTitleTextAttributes([
			.font: UIFont.init(name: "SFProDisplay-Medium", size: 10)!
		], for: .normal);
		
		// UINavigationBar Appearance
		UINavigationBar.appearance().titleTextAttributes = [
			.font: UIFont.init(name: "SFProDisplay-SemiBold", size: 17)!
		];
		
		// UIBarButtonItem
		UIBarButtonItem.appearance().tintColor = UIColor.init(named: "Red");
	}
}

