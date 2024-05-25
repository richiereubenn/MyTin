//
//  OnboardingItemView.swift
//  MyTin
//
//  Created by Sophia Madlentsy Tambunan on 5/25/24.
//

import SwiftUI

struct OnboardingItemView: View {
    let data: OnboardingModel
    var body: some View {
        VStack(alignment: .center) {
            data.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            Text(data.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color(uiColor: .label))
            
            Text(data.description)
                .font(.caption)
                .lineLimit(0)
                .multilineTextAlignment(.center)
        }
        .foregroundStyle(Color(uiColor: .label))
    }
}

//#Preview {
//    OnboardingItemView()
//}
