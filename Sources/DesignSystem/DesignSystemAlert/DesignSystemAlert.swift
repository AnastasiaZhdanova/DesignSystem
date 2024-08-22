import SwiftUI
import UIKit

public class DesignSystemAlert {
    public init() {
    }
    
    public func swiftUIAlert(withType type: DesignSystemAlertType,
                             _ completion: @escaping () -> Void) -> AnyView {
        let viewModel = DesignSystemAlertViewModelImpl(type: type,
                                                       completion)
        
        return AnyView(DesignSystemScreenAlertView(viewModel: viewModel))
    }
    
    public func uiKitAlert(withType type: DesignSystemAlertType,
                           _ completion: @escaping () -> Void) -> UIViewController {
        let viewModel = DesignSystemAlertViewModelImpl(type: type,
                                                       completion)
        let view = DesignSystemScreenAlertView(viewModel: viewModel)
        
        let viewController = UIHostingController(rootView: view)
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.view.backgroundColor = .clear
        
        return viewController
    }
}

public struct DSAlert: View {
    private let type: DesignSystemAlertType
    private let tapAction: () -> Void
    
    public init(type: DesignSystemAlertType,
                tapAction: @escaping () -> Void) {
        self.type = type
        self.tapAction = tapAction
    }
    
    public var body: some View {
        DesignSystemAlertView(titleText: type.title,
                              imageName: type.imageName,
                              color: type.color,
                              tapAction: tapAction)
    }
}

public class UIDSAlert {
    public let view: UIView

    
    private let type: DesignSystemAlertType
    private let tapAction: () -> Void
    
    public init(type: DesignSystemAlertType,
                tapAction: @escaping () -> Void) {
        self.type = type
        self.tapAction = tapAction
        
        let view = DesignSystemAlertView(titleText: type.title,
                                         imageName: type.imageName,
                                         color: type.color,
                                         tapAction: tapAction)
        
        self.view = UIHostingController(rootView: view).view
        
    }
}
