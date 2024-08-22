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
        
        let successScreenDemoButton = UIButton(frame:CGRect(x: 50, y: 200, width: 300, height: 50))
        successScreenDemoButton.setTitle("Success Screen Demo", for: .normal)
        successScreenDemoButton.titleLabel?.font =  UIFont.systemFont(ofSize: 12)
        successScreenDemoButton.setTitleColor(.black, for: .normal)
        successScreenDemoButton.layer.cornerRadius = 12
        successScreenDemoButton.layer.borderWidth = 1
        successScreenDemoButton.layer.borderColor = UIColor.black.cgColor
        successScreenDemoButton.addTarget(self,
                                          action: #selector(successScreenDemoAction),
                                          for: .touchUpInside)

        
        let successViewDemoButton = UIButton(frame:CGRect(x: 50, y: 200, width: 300, height: 50))
        successViewDemoButton.setTitle("Success View Demo", for: .normal)
        successViewDemoButton.titleLabel?.font =  UIFont.systemFont(ofSize: 12)
        successViewDemoButton.setTitleColor(.black, for: .normal)
        successViewDemoButton.layer.cornerRadius = 12
        successViewDemoButton.layer.borderWidth = 1
        successViewDemoButton.layer.borderColor = UIColor.black.cgColor
        successViewDemoButton.addTarget(self,
                                          action: #selector(successViewDemoAction),
                                          for: .touchUpInside)
        
        let errorScreenDemoButton = UIButton(frame:CGRect(x: 50, y: 300, width: 300, height: 50))
        errorScreenDemoButton.setTitle("Error Screen Demo", for: .normal)
        errorScreenDemoButton.titleLabel?.font =  UIFont.systemFont(ofSize: 12)
        errorScreenDemoButton.setTitleColor(.black, for: .normal)
        errorScreenDemoButton.layer.cornerRadius = 12
        errorScreenDemoButton.layer.borderWidth = 1
        errorScreenDemoButton.layer.borderColor = UIColor.black.cgColor
        errorScreenDemoButton.addTarget(self,
                                          action: #selector(errorScreenDemoAction),
                                          for: .touchUpInside)
        
        let errorViewDemoButton = UIButton(frame:CGRect(x: 50, y: 300, width: 300, height: 50))
        errorViewDemoButton.setTitle("Error View Demo", for: .normal)
        errorViewDemoButton.titleLabel?.font =  UIFont.systemFont(ofSize: 12)
        errorViewDemoButton.setTitleColor(.black, for: .normal)
        errorViewDemoButton.layer.cornerRadius = 12
        errorViewDemoButton.layer.borderWidth = 1
        errorViewDemoButton.layer.borderColor = UIColor.black.cgColor
        errorViewDemoButton.addTarget(self,
                                          action: #selector(errorViewDemoAction),
                                          for: .touchUpInside)
        
        let notifyScreenDemoButton = UIButton(frame:CGRect(x: 50, y: 400, width: 300, height: 50))
        notifyScreenDemoButton.setTitle("Notify Screen Demo", for: .normal)
        notifyScreenDemoButton.titleLabel?.font =  UIFont.systemFont(ofSize: 12)
        notifyScreenDemoButton.setTitleColor(.black, for: .normal)
        notifyScreenDemoButton.layer.cornerRadius = 12
        notifyScreenDemoButton.layer.borderWidth = 1
        notifyScreenDemoButton.layer.borderColor = UIColor.black.cgColor
        notifyScreenDemoButton.addTarget(self,
                                          action: #selector(notifyScreenDemoAction),
                                          for: .touchUpInside)
        
        let notifyViewDemoButton = UIButton(frame:CGRect(x: 50, y: 400, width: 300, height: 50))
        notifyViewDemoButton.setTitle("Notify View Demo", for: .normal)
        notifyViewDemoButton.titleLabel?.font =  UIFont.systemFont(ofSize: 12)
        notifyViewDemoButton.setTitleColor(.black, for: .normal)
        notifyViewDemoButton.layer.cornerRadius = 12
        notifyViewDemoButton.layer.borderWidth = 1
        notifyViewDemoButton.layer.borderColor = UIColor.black.cgColor
        notifyViewDemoButton.addTarget(self,
                                          action: #selector(notifyViewDemoAction),
                                          for: .touchUpInside)
        
        let successButtonStackView = UIStackView()
        successButtonStackView.alignment = .fill
        successButtonStackView.distribution = .fillEqually
        successButtonStackView.spacing = 8.0

        successButtonStackView.addArrangedSubview(successScreenDemoButton)
        successButtonStackView.addArrangedSubview(successViewDemoButton)
        
        let errorButtonStackView = UIStackView()
        errorButtonStackView.alignment = .fill
        errorButtonStackView.distribution = .fillEqually
        errorButtonStackView.spacing = 8.0

        errorButtonStackView.addArrangedSubview(errorScreenDemoButton)
        errorButtonStackView.addArrangedSubview(errorViewDemoButton)
        
        let notifyButtonStackView = UIStackView()
        notifyButtonStackView.alignment = .fill
        notifyButtonStackView.distribution = .fillEqually
        notifyButtonStackView.spacing = 8.0

        notifyButtonStackView.addArrangedSubview(notifyScreenDemoButton)
        notifyButtonStackView.addArrangedSubview(notifyViewDemoButton)
        
        let buttonsStack = UIStackView()
        buttonsStack.alignment = .fill
        buttonsStack.distribution = .fillEqually
        buttonsStack.spacing = 24.0
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
    
    @objc
    func successScreenDemoAction() {
        let alertViewController = designSystem.uiKitAlert(withType: .success(title: "Success Message")) {
            self.window?.rootViewController?.dismiss(animated: false)
        }

        window?.rootViewController?.present(alertViewController, animated: false)
    }
    
    @objc
    func successViewDemoAction() {
        let alert = UIDSAlert(type: .success(title: "Success Message")) {
            self.alertView.removeFromSuperview()
        }
        alertView = alert.view
        window?.rootViewController?.view.addSubview(alertView)
        
        guard let rootViewController = window?.rootViewController else {
            return
        }
        alertView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alertView.leadingAnchor.constraint(equalTo: rootViewController.view.leadingAnchor),
            alertView.trailingAnchor.constraint(equalTo: rootViewController.view.trailingAnchor),

            alertView.centerXAnchor.constraint(equalTo: rootViewController.view.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: rootViewController.view.centerYAnchor)
        ])
    }
    
    @objc
    func errorScreenDemoAction() {
        let alertViewController = designSystem.uiKitAlert(withType: .error(title: "Error Message")) {
            self.window?.rootViewController?.dismiss(animated: false)
        }
        
        window?.rootViewController?.present(alertViewController, animated: false)
    }
    
    @objc
    func errorViewDemoAction() {
        let alert = UIDSAlert(type: .error(title: "Error Message")) {
            self.alertView.removeFromSuperview()
        }
        alertView = alert.view
        window?.rootViewController?.view.addSubview(alertView)
        
        guard let rootViewController = window?.rootViewController else {
            return
        }
        alertView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alertView.leadingAnchor.constraint(equalTo: rootViewController.view.leadingAnchor),
            alertView.trailingAnchor.constraint(equalTo: rootViewController.view.trailingAnchor),

            alertView.centerXAnchor.constraint(equalTo: rootViewController.view.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: rootViewController.view.centerYAnchor)
        ])
    }
    
    @objc
    func notifyScreenDemoAction() {
        let alertViewController = designSystem.uiKitAlert(withType: .notify(title: "Notification Message")) {
            self.window?.rootViewController?.dismiss(animated: false)
        }
        
        window?.rootViewController?.present(alertViewController, animated: false)
    }
    
    @objc
    func notifyViewDemoAction() {
        let alert = UIDSAlert(type: .notify(title: "Notification Message")) {
            self.alertView.removeFromSuperview()
        }
        alertView = alert.view
        window?.rootViewController?.view.addSubview(alertView)
        
        guard let rootViewController = window?.rootViewController else {
            return
        }
        alertView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alertView.leadingAnchor.constraint(equalTo: rootViewController.view.leadingAnchor),
            alertView.trailingAnchor.constraint(equalTo: rootViewController.view.trailingAnchor),

            
            alertView.centerXAnchor.constraint(equalTo: rootViewController.view.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: rootViewController.view.centerYAnchor)
        ])
    }
}
