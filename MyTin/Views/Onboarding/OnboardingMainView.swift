//
//  OnboardingMainView.swift
//  MyTin
//
//  Created by Sophia Madlentsy Tambunan on 5/25/24.
//

import SwiftUI

struct OnboardingMainView: View {
    @StateObject var viewModel =
        OnboardingMainViewModel()
    @State private var onboardingIndex = 0
    var body: some View {
        OnboardingSliderView(index: $onboardingIndex){
            ForEach(viewModel.onboardingData){
                item in
            OnboardingItemView(data: item)
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    OnboardingMainView()
}
