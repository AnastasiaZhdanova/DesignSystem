import SwiftUI

struct DesignSystemScreenAlertView<ViewModel>: View where ViewModel: DesignSystemAlertViewModel {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            DesignSystemAlertView(titleText: viewModel.title,
                                  imageName: viewModel.imageName,
                                  color: viewModel.color,
                                  tapAction: viewModel.closeButtonTapped)
            
            Spacer()
        }
        .offset(y: viewModel.offsetYValue)
        .onAppear(perform: viewModel.onAppear)
    }
}
