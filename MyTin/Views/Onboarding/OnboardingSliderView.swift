//
//  OnboardingSliderView.swift
//  MyTin
//
//  Created by Sophia Madlentsy Tambunan on 5/25/24.
//

import SwiftUI

struct OnboardingSliderView<Content>: View where Content: View {
    @Binding var index: Int
    @EnvironmentObject var viewModel: OnboardingMainViewModel
    @State private var offset: CGFloat = .zero
    @State private var dragging: Bool = false
    let content: () -> Content
        
    var body: some View {
        ZStack{
            VStack{
                GeometryReader { geometery in
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 0){
                            self.content()
                                .frame(width: geometery.size.width, height: geometery.size.height)
                                .clipped()
                        }
                    }//:SCROLL VIEW
                    .content.offset(x: self.offset(in: geometery), y:0)
                    .frame(width:geometery.size.width, alignment: .leading)
                    .gesture(
                        DragGesture().onChanged { value in
                            self.dragging = true
                            self.offset = -CGFloat(self.index) * geometery.size.width + value.translation.width
                        }
                            .onEnded { value in
                                let predictedEndOffset = -CGFloat(self.index) * geometery.size.width + value.predictedEndTranslation.width
                                let predictedIndex = Int(round(predictedEndOffset / -geometery.size.width))
                                self.index = self.clampedIndex(from: predictedIndex)
                                withAnimation {
                                    self.dragging = false 
                                }
                            }
                    )
                }//:GEOMETERY
            }//:VSTACK
        }//:ZSTACK
    }
    
    private func offset(in geometery: GeometryProxy)-> CGFloat{
        if self.dragging {
            return max(min(self.offset, 0), -CGFloat(viewModel.onboardingData.count - 1) * geometery.size.width)
        } else{
           return -CGFloat(self.index) * geometery.size.width
        }
    }
    
    private func clampedIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(max(predictedIndex, self.index-1), self.index + 1)
        
        guard newIndex >= 0 else { return 0}
        guard newIndex <= viewModel.onboardingData.count - 1 else {
            return viewModel.onboardingData.count - 1}
        return newIndex
    }
}

//#Preview {
//    OnboardingSliderView()
//}
