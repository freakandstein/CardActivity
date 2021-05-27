//
//  LoadingView.swift
//  CardActivity
//
//  Created by satrio.wicaksono on 07/03/21.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.25)
            VStack(alignment: .center) {
                Circle()
                    .trim(from: 0, to: 0.9)
                    .stroke(Color.green, lineWidth: 4)
                    .frame(width: 42, height: 42)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(Animation.default.speed(0.3).repeatForever(autoreverses: false))
                    .padding(.top, 16)
                Text("Please wait")
                    .font(.caption)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom, 4)
                    .padding(.top, 4)
            }.background(Color(.white)).frame(width: .none, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(8.0)
            .onAppear() {
                isLoading.toggle()
            }
        }.ignoresSafeArea()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
