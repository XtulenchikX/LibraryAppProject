import UIKit

// MARK: - Function For Initializing Custom TabBar

func setupTabBarAppearance() {
    let appearance = UITabBarAppearance()
    let baseColor = UIColor.systemBackground
    let transparentBackground = baseColor.withAlphaComponent(0.95)
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = transparentBackground
    appearance.stackedLayoutAppearance.selected.iconColor = .systemBlue
    appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
    appearance.stackedLayoutAppearance.normal.iconColor = .systemGray
    appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemGray]

    UITabBar.appearance().standardAppearance = appearance
    if #available(iOS 15.0, *) {
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}
