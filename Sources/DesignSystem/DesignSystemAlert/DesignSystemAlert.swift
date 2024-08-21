import SwiftUI

public class DesignSystemAlert {
    
    private let alertTye: DesignSystemAlertType
    
    public init(type: DesignSystemAlertType) {
        self.alertTye = type
    }
    
    public func swiftUIAlert() -> AnyView {
        let vm = DesignSystemAlertViewModelImpl(type: alertTye) {
            //
        }
        
        return AnyView(DesignSystemAlertView(viewModel: vm))
    }
}
