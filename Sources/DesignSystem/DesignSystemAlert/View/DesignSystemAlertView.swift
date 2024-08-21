import SwiftUI

struct DesignSystemAlertView <ViewModel>: View where ViewModel: DesignSystemAlertViewModel {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        context
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
        .background(viewModel.color.opacity(0.1))
        .clipShape(
            RoundedRectangle(cornerRadius: 8)
        )
        .padding(8)
    }
    
    var image: some View {
        Image(ImageResource(name: viewModel.imageName, bundle: .module))
            .renderingMode(.template)
            .foregroundStyle(viewModel.color)
            .padding(.leading, 24)
    }
    
    var title: some View {
        Text(viewModel.title).font(Font.custom("Roboto-Regular", size: 16.0))
            .foregroundStyle(viewModel.color)
            .padding(.horizontal, 12)
    }
    
    var closeButton: some View {
        Image(.cross)
            .renderingMode(.template)
            .foregroundStyle(Color(red: 37/255, green: 37/255, blue: 37/255))
            .padding(.trailing, 24)
            .onTapGesture {
            print("cross tapped")
        }
    }
}
