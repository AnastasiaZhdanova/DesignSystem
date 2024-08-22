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
                    Spacer()
                    
                    if showAlertView {
                        presentViewAlert()
                    }
                    
                    Text("SwiftUI")
                    
                    demoBittons
                }
                
                if showAlertScreen {
                    presentScreenAlert()
                }
            }
        }
    }
}

private extension ShowroomApp {
    // MARK: - Alert View
    func presentViewAlert() -> AnyView {
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
        
        return AnyView(
            DSAlert(type: type, tapAction: {
                self.toggleViewAlert()
            })
        )
    }
    
    func presentScreenAlert() -> AnyView {
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
        
        return designSystem.swiftUIAlert(withType: type) {
            self.toggleScreenAlert()
        }
    }
    
    // MARK: - Demo Buttons
    var demoBittons: some View {
        VStack(spacing: 8) {
            successButtons
            notifyButtons
            errorButtons
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
        Text("Success Screen Demo")
            .frame(minWidth: 0, maxWidth: .infinity)
            .font(.system(size: 12))
            .padding()
            .foregroundStyle(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 2)
            )
            .onTapGesture {
                demoTapAction(.successScreen)
            }
    }
    
    var successViewDemoButton: some View {
        Text("Success View Demo")
            .frame(minWidth: 0, maxWidth: .infinity)
            .font(.system(size: 12))
            .padding()
            .foregroundStyle(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 2)
            )
            .onTapGesture {
                demoTapAction(.successView)
            }
    }
    
    var errorScreenDemoButton: some View {
        Text("Error Screen Demo")
            .frame(minWidth: 0, maxWidth: .infinity)
            .font(.system(size: 12))
            .padding()
            .foregroundStyle(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 2)
            )
            .onTapGesture {
                demoTapAction(.errorScreen)
            }
    }
    
    var errorViewDemoButton: some View {
        Text("Error View Demo")
            .frame(minWidth: 0, maxWidth: .infinity)
            .font(.system(size: 12))
            .padding()
            .foregroundStyle(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 2)
            )
            .onTapGesture {
                demoTapAction(.errorView)
            }
    }
    
    var notifyScreenDemoButton: some View {
        Text("Notify Screen Demo")
            .frame(minWidth: 0, maxWidth: .infinity)
            .font(.system(size: 12))
            .padding()
            .foregroundStyle(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 2)
            )
            .onTapGesture {
                demoTapAction(.notifyScreen)
            }
    }
    
    var notifyViewDemoButton: some View {
        Text("Notify View Demo")
            .frame(minWidth: 0, maxWidth: .infinity)
            .font(.system(size: 12))
            .padding()
            .foregroundStyle(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 2)
            )
            .onTapGesture {
                demoTapAction(.notifyView)
            }
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
