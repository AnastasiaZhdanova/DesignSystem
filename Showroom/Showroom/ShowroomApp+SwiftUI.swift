import SwiftUI
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
struct ShowroomApp: App {
    let designSystem = DesignSystemAlert()
    
    @State var showAlertScreen: Bool = false
    @State var showAlertView: Bool = false
    @State var selectedType: DemoButtonType = .successScreen
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                VStack(spacing: 4) {
                    Text("SwiftUI")
                        .padding(.top, 80)
                    
                    Spacer()
                    
                    if showAlertView {
                        presentViewAlert {
                            toggleViewAlert()
                        }
                    }
                    demoButtons
                }
                
                if showAlertScreen {
                    presentScreenAlert {
                        toggleScreenAlert()
                    }
                }
            }
        }
    }
}

private extension ShowroomApp {
    // MARK: - Alert View
    func presentViewAlert(_ completion: @escaping () -> Void) -> AnyView {
        var type: DesignSystemAlertType {
            switch selectedType {
            case .successView, .successScreen:
                return .success(title: "Success Message")
            case .errorView, .errorScreen:
                return .error(title: "Error Mesage")
            case .notifyView, .notifyScreen:
                return .notify(title: "Notification Message")
            }
        }
        
        return AnyView(
            DSAlert(type: type, tapAction: completion)
        )
    }
    
    func presentScreenAlert(_ completion: @escaping () -> Void) -> AnyView {
        let type: DesignSystemAlertType = {
            switch selectedType {
            case .successView, .successScreen:
                return .success(title: "Success Message")
            case .errorView, .errorScreen:
                return .error(title: "Error Mesage")
            case .notifyView, .notifyScreen:
                return .notify(title: "Notification Message")
            }
        }()
        
        return designSystem.swiftUIAlert(withType: type, completion)
    }
    
    // MARK: - Demo Buttons
    var demoButtons: some View {
        VStack(spacing: 8) {
            successButtons
            errorButtons
            notifyButtons
        }
        .padding()
    }
    
    var successButtons: some View {
        HStack(alignment: .center, spacing: 8) {
            successScreenDemoButton
            successViewDemoButton
        }
    }
    
    var errorButtons: some View {
        HStack(alignment: .center, spacing: 8) {
            errorScreenDemoButton
            errorViewDemoButton
        }
    }
    
    var notifyButtons: some View {
        HStack(alignment: .center, spacing: 8) {
            notifyScreenDemoButton
            notifyViewDemoButton
        }
    }
    
    var successScreenDemoButton: some View {
        textView("Success Screen Demo")
            .onTapGesture {
                demoTapAction(.successScreen)
            }
    }
    
    var successViewDemoButton: some View {
        textView("Success View Demo")
            .onTapGesture {
                demoTapAction(.successView)
            }
    }
    
    var errorScreenDemoButton: some View {
        textView("Error Screen Demo")
            .onTapGesture {
                demoTapAction(.errorScreen)
            }
    }
    
    var errorViewDemoButton: some View {
        textView("Error View Demo")
            .onTapGesture {
                demoTapAction(.errorView)
            }
    }
    
    var notifyScreenDemoButton: some View {
        textView("Notify Screen Demo")
            .onTapGesture {
                demoTapAction(.notifyScreen)
            }
    }
    
    var notifyViewDemoButton: some View {
        textView("Notify View Demo")
            .onTapGesture {
                demoTapAction(.notifyView)
            }
    }
    
    func textView(_ text: String) -> AnyView {
        AnyView(
            Text(text)
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: 12))
                .padding()
                .foregroundStyle(Color.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 2)
                )
        )
    }
    
    // MARK: - Demo Actions
    func toggleScreenAlert() {
        DispatchQueue.main.async {
            withAnimation {
                self.showAlertScreen.toggle()
            }
        }
    }
    
    func toggleViewAlert() {
        DispatchQueue.main.async {
            withAnimation {
                self.showAlertView.toggle()
            }
        }
    }
    
    func demoTapAction(_ type: DemoButtonType) {
        self.selectedType = type
        
        switch type {
        case .errorScreen, .notifyScreen, .successScreen:
            toggleScreenAlert()
        default:
            toggleViewAlert()
        }
    }
}
