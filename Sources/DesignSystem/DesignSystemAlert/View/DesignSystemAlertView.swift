import SwiftUI

struct DesignSystemAlertView: View  {
    @State var titleText: String
    @State var imageName: String
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
    }
    
    var image: some View {
        Image(ImageResource(name: imageName, bundle: .module))
            .renderingMode(.template)
            .foregroundStyle(color)
            .padding(.leading, 24)
    }
    
    var title: some View {
        Text(titleText)
            .font(Font.custom("Roboto-Regular", size: 16.0))
            .foregroundStyle(color)
            .padding(.horizontal, 12)
    }
    
    var closeButton: some View {
        Image(.cross)
            .renderingMode(.template)
            .foregroundStyle(Color(red: 37/255, green: 37/255, blue: 37/255))
            .padding(.trailing, 24)
            .onTapGesture(perform: tapAction)
    }
}
