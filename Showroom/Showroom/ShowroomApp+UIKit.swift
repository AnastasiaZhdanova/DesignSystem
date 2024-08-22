import UIKit
import DesignSystem

enum DemoButtonType {
    case successScreen
    case successView
    case errorScreen
    case errorView
    case notifyScreen
    case notifyView
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let designSystem = DesignSystemAlert()
    
    var window: UIWindow?
    var alertView: UIView = UIView()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let label = UILabel(frame: CGRect(x: 50, y: 200, width: 300, height: 50))
        label.text = "UIKit"
        label.textAlignment = .center
        label.backgroundColor = .white
        
        let successScreenDemoButton = configDemoButton(with: "Success Screen Demo")
        successScreenDemoButton.addTarget(self,
                                          action: #selector(successScreenDemoAction),
                                          for: .touchUpInside)
        
        
        let successViewDemoButton = configDemoButton(with: "Success View Demo")
        successViewDemoButton.addTarget(self,
                                        action: #selector(successViewDemoAction),
                                        for: .touchUpInside)
        
        let errorScreenDemoButton = configDemoButton(with: "Error Screen Demo")
        errorScreenDemoButton.addTarget(self,
                                        action: #selector(errorScreenDemoAction),
                                        for: .touchUpInside)
        
        let errorViewDemoButton = configDemoButton(with: "Error View Demo")
        errorViewDemoButton.addTarget(self,
                                      action: #selector(errorViewDemoAction),
                                      for: .touchUpInside)
        
        let notifyScreenDemoButton = configDemoButton(with: "Notify Screen Demo")
        notifyScreenDemoButton.addTarget(self,
                                         action: #selector(notifyScreenDemoAction),
                                         for: .touchUpInside)
        
        let notifyViewDemoButton = configDemoButton(with: "Notify View Demo")
        notifyViewDemoButton.addTarget(self,
                                       action: #selector(notifyViewDemoAction),
                                       for: .touchUpInside)
        
        let successButtonStackView = configUIStackView()
        
        successButtonStackView.addArrangedSubview(successScreenDemoButton)
        successButtonStackView.addArrangedSubview(successViewDemoButton)
        
        let errorButtonStackView = configUIStackView()
        
        errorButtonStackView.addArrangedSubview(errorScreenDemoButton)
        errorButtonStackView.addArrangedSubview(errorViewDemoButton)
        
        let notifyButtonStackView = configUIStackView()
        
        notifyButtonStackView.addArrangedSubview(notifyScreenDemoButton)
        notifyButtonStackView.addArrangedSubview(notifyViewDemoButton)
        
        let buttonsStack = configUIStackView()
        buttonsStack.axis = .vertical
        
        buttonsStack.addArrangedSubview(successButtonStackView)
        buttonsStack.addArrangedSubview(errorButtonStackView)
        buttonsStack.addArrangedSubview(notifyButtonStackView)
        
        let viewController = UIViewController()
        let view = UIView()
        view.backgroundColor = .white
        viewController.view = view
        viewController.view.addSubview(buttonsStack)
        viewController.view.addSubview(label)
        
        
        successButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        errorButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        notifyButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonsStack.leadingAnchor.constraint(equalTo:  viewController.view.leadingAnchor, constant: 8),
            buttonsStack.bottomAnchor.constraint(equalTo:  viewController.view.safeAreaLayoutGuide.bottomAnchor),
            buttonsStack.trailingAnchor.constraint(equalTo:  viewController.view.trailingAnchor, constant: -8),
            
            label.bottomAnchor.constraint(equalTo:  buttonsStack.bottomAnchor, constant: 8),
        ])
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = viewController
        
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}

private extension AppDelegate {
    // MARK: - Demo Buttons
    func configDemoButton(with title: String) -> UIButton {
        let button = UIButton(frame:CGRect(x: 50, y: 200, width: 300, height: 50))
        button.setTitle(title, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 12)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }
    
    func configUIStackView() -> UIStackView {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 24.0
        
        return stack
    }
    
    func configAlertViewConstraints(_ rootViewController: UIViewController) {
        alertView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alertView.leadingAnchor.constraint(equalTo: rootViewController.view.leadingAnchor),
            alertView.trailingAnchor.constraint(equalTo: rootViewController.view.trailingAnchor),
            alertView.centerXAnchor.constraint(equalTo: rootViewController.view.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: rootViewController.view.centerYAnchor)
        ])
    }
    
    // MARK: - Demo Actions
    @objc
    func successScreenDemoAction() {
        let alertViewController = designSystem.uiKitAlert(withType: .success(title: "Success Message")) { [weak self] in
            self?.window?.rootViewController?.dismiss(animated: false)
        }
        
        window?.rootViewController?.present(alertViewController, animated: false)
    }
    
    @objc
    func successViewDemoAction() {
        let alert = UIDSAlert(type: .success(title: "Success Message")) { [weak self] in
            self?.alertView.removeFromSuperview()
        }
        alertView = alert.view
        window?.rootViewController?.view.addSubview(alertView)
        
        guard let rootViewController = window?.rootViewController else {
            return
        }
        
        configAlertViewConstraints(rootViewController)
    }
    
    @objc
    func errorScreenDemoAction() {
        let alertViewController = designSystem.uiKitAlert(withType: .error(title: "Error Message")) { [weak self] in
            self?.window?.rootViewController?.dismiss(animated: false)
        }
        
        window?.rootViewController?.present(alertViewController, animated: false)
    }
    
    @objc
    func errorViewDemoAction() {
        let alert = UIDSAlert(type: .error(title: "Error Message")) { [weak self] in
            self?.alertView.removeFromSuperview()
        }
        alertView = alert.view
        window?.rootViewController?.view.addSubview(alertView)
        
        guard let rootViewController = window?.rootViewController else {
            return
        }
        
        configAlertViewConstraints(rootViewController)
    }
    
    @objc
    func notifyScreenDemoAction() {
        let alertViewController = designSystem.uiKitAlert(withType: .notify(title: "Notification Message")) { [weak self] in
            self?.window?.rootViewController?.dismiss(animated: false)
        }
        
        window?.rootViewController?.present(alertViewController, animated: false)
    }
    
    @objc
    func notifyViewDemoAction() {
        let alert = UIDSAlert(type: .notify(title: "Notification Message")) { [weak self] in
            self?.alertView.removeFromSuperview()
        }
        alertView = alert.view
        window?.rootViewController?.view.addSubview(alertView)
        
        guard let rootViewController = window?.rootViewController else {
            return
        }
        configAlertViewConstraints(rootViewController)
    }
}
