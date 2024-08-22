import SwiftUI

struct DesignSystemScreenAlertView<ViewModel>: View where ViewModel: DesignSystemAlertViewModel {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            DesignSystemAlertView(titleText: viewModel.title,
                                  titleAccessibilityLabel: viewModel.titleAccessibilityLabel,
                                  titleAccessibilityHint: viewModel.titleAccessibilityHint,
                                  imageName: viewModel.imageName,
                                  imageAccessibilityLabel: viewModel.imageAccessibilityLabel,
                                  imageAccessibilityHint: viewModel.imageAccessibilityHint,
                                  color: viewModel.color,
                                  tapAction: viewModel.closeButtonTapped)
            
            Spacer()
        }
        .offset(y: viewModel.offsetYValue)
        .onAppear(perform: viewModel.onAppear)
    }
}
