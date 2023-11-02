//
//  RoundButton.swift
//  TheCoffeeHouse-Clone
//
//  Created by Nga Vũ on 02/11/2023.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Title"
    var didTap: (()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(width: .screenWidth * 0.75, height: .screenHeight * 0.06)
        .background( Color.primaryApp)
        .cornerRadius(10)
    }
}

#Preview {
    RoundButton()
        .padding(20)
}
