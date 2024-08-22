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
    var color: Color { get }
    
    func onAppear()
    func closeButtonTapped()
}


class DesignSystemAlertViewModelImpl: DesignSystemAlertViewModel {
    @Published var offsetYValue: Double = -300
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
    
    func onAppear() {
        self.changeOffset(0)
    }
    
    func closeButtonTapped() {
        changeOffset(-300)

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
