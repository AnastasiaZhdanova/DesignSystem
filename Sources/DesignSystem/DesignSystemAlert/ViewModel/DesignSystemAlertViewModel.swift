import SwiftUI

public enum DesignSystemAlertType {
    case error(title: String)
    case success(title: String)
    case notify(title: String)
    
    var imageName: String {
        switch self {
        case .error:
            return "error"
        case .success:
            return "success"
        case .notify:
            return "bell"
        }
    }
    
    var imageAccessibilityLabel: String {
        switch self {
        case .error:
            return "error image"
        case .success:
            return "success image"
        case .notify:
            return "notify image"
        }
    }
    
    var imageAccessibilityHint: String {
        switch self {
        case .error:
            return "error message hint"
        case .success:
            return "success message hint"
        case .notify:
            return "bell message hint"
        }
    }
    
    var title: String {
        switch self {
        case .error(let title):
            return "Error: \(title)"
        case .success(let title):
            return "Success: \(title)"
        case .notify(let title):
            return "Notification: \(title)"
        }
    }
    
    var titleAccessibilityLabel: String {
        // should to provide additional accessability hint text for all cases
        return title
    }
    
    var titleAccessibilityHint: String {
        // should to provide additional accessability hint text for all cases
        return title
    }
    
    
    var color: Color {
        switch self {
        case .error:
            return Color(red: 240/255, green: 61/255, blue: 62/255)
        case .success:
            return Color(red: 0/255, green: 123/255, blue: 64/255)
        case .notify:
            return Color(red: 216/255, green: 73/255, blue: 16/255)
        }
    }
}

protocol DesignSystemAlertViewModel: ObservableObject {
    var offsetYValue: Double { get }
    var imageName: String { get }
    var title: String { get }
    var titleAccessibilityLabel: String { get }
    var titleAccessibilityHint: String { get }
    var imageAccessibilityLabel: String { get }
    var imageAccessibilityHint: String { get }
    var color: Color { get }
    
    func onAppear()
    func closeButtonTapped()
}


class DesignSystemAlertViewModelImpl: DesignSystemAlertViewModel {
    @Published var offsetYValue: Double = -300
    @Published var color: Color
    
    @Published var title: String
    @Published var titleAccessibilityLabel: String
    @Published var titleAccessibilityHint: String
    
    @Published var imageName: String
    @Published var imageAccessibilityLabel: String
    @Published var imageAccessibilityHint: String
    
    private var closeTapped: () -> Void
    
    init(type: DesignSystemAlertType,
         _ completion: @escaping() -> Void) {
        self.imageName = type.imageName
        self.imageAccessibilityLabel = type.imageAccessibilityLabel
        self.imageAccessibilityHint = type.imageAccessibilityHint
        self.title = type.title
        self.titleAccessibilityLabel = type.titleAccessibilityLabel
        self.titleAccessibilityHint = type.titleAccessibilityHint
        self.color = type.color
        self.closeTapped = completion
    }
    
    func onAppear() {
        self.changeOffset(0)
    }
    
    func closeButtonTapped() {
        changeOffset(-300)
        
        // needed to smooth alert dissapearing with animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.closeTapped()
        }
    }
    
    private func changeOffset(_ value: Double) {
        DispatchQueue.main.async {
            withAnimation {
                self.offsetYValue = value
            }
        }
    }
}
