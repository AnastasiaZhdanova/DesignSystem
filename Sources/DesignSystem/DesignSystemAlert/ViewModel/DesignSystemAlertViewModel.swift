import SwiftUI

public enum DesignSystemAlertType {
    case error(title: String)
    case success(title: String)
    case notify(title: String)
    case custom(imageName: String, title: String, color: Color)
    
    var imageName: String {
        switch self {
        case .error:
            return "error"
        case .success:
            return "success"
        case .notify:
            return "bell"
        case .custom(let imageName, _, _):
            return imageName
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
        case .custom( _, let title, _):
            return title
        }
    }
    
    var color: Color {
        switch self {
        case .error:
            return Color(red: 240/255, green: 61/255, blue: 62/255)
        case .success:
            return Color(red: 0/255, green: 123/255, blue: 64/255)
        case .notify:
            return Color(red: 216/255, green: 73/255, blue: 16/255)
        case .custom( _, _, let color):
            return color
        }
    }
}

protocol DesignSystemAlertViewModel: ObservableObject {
    var imageName: String { get }
    var title: String { get }
    var color: Color { get }
    
    func closeButtonTapped()
}


class DesignSystemAlertViewModelImpl: DesignSystemAlertViewModel {
    @Published var imageName: String
    @Published var title: String
    @Published var color: Color
    
    private var closeTapped: () -> Void
    
    init(type: DesignSystemAlertType, 
         _ completion: @escaping() -> Void) {
        self.imageName = type.imageName
        self.title = type.title
        self.color = type.color
        self.closeTapped = completion
    }
    
    func closeButtonTapped() {
        closeTapped()
    }
}
