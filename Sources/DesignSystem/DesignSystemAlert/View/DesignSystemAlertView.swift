import SwiftUI

struct DesignSystemAlertView: View  {
    @State var titleText: String
    @State var titleAccessibilityLabel: String
    @State var titleAccessibilityHint: String
    @State var imageName: String
    @State var imageAccessibilityLabel: String
    @State var imageAccessibilityHint: String
    @State var color: Color
    
    var tapAction: () -> Void
    
    var body: some View {
        VStack {
            context
        }
    }
}

private extension DesignSystemAlertView {
    var context: some View {
        HStack(alignment: .center) {
            image
            title
            Spacer()
            closeButton
        }
        .frame(minHeight: 48)
        .background(color.opacity(0.1))
        .clipShape(
            RoundedRectangle(cornerRadius: 8)
        )
        .padding(8)
        .accessibilityLabel("Alert message")
        .accessibilityHint("Alert message, notify about the status of the current operation or process in the application")
    }
    
    var image: some View {
        Image(ImageResource(name: imageName, bundle: .module))
            .renderingMode(.template)
            .foregroundStyle(color)
            .padding(.leading, 24)
            .accessibilityLabel(imageAccessibilityLabel)
            .accessibilityHint(imageAccessibilityHint)
    }
    
    var title: some View {
        Text(titleText)
            .font(Font.custom("Roboto-Regular", size: 16.0))
            .foregroundStyle(color)
            .padding(.horizontal, 12)
            .accessibilityLabel(titleAccessibilityLabel)
            .accessibilityHint(titleAccessibilityHint)
    }
    
    var closeButton: some View {
        Image(.cross)
            .renderingMode(.template)
            .foregroundStyle(Color(red: 37/255, green: 37/255, blue: 37/255))
            .padding(.trailing, 24)
            .onTapGesture(perform: tapAction)
            .accessibilityLabel("Close button")
            .accessibilityHint("Tap to close alert")
            .accessibilityAction(named: "Close", tapAction)
    }
}
