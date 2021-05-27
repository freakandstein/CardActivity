//
//  ContentView.swift
//  CardActivity
//
//  Created by satrio.wicaksono on 07/03/21.
//

import SwiftUI

struct MainView: View {
    // Mock Model
    var friends: [Friend] = [
        Friend(id: 1, name: "Satrio", street: "Arjuna Street", city: "Brooklyn"),
        Friend(id: 2, name: "Wicaksono", street: "Sudirman Street", city: "Dubai"),
        Friend(id: 3, name: "Tio", street: "Onokawa Street", city: "Jakarta")
    ]
    
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            switch viewModel.state {
            case .loading:
                LoadingGradientView()
            case .failure(let error):
                VStack {
                    Text("Error Code: \(error.errorCode)")
                    Text("Error Message: \(error.errorMessage)")
                }
            case .success(let friends):
                NavigationView {
                    ScrollView {
                        VStack {
                            ForEach(friends, id: \.id) { friend in
                                NavigationLink(destination: DetailCardActivity()) {
                                    FriendCellView(friend: friend)
                                }.isDetailLink(false).foregroundColor(.black)
                            }
                        }.padding([.leading, .trailing])
                    }.navigationBarTitle("Personal Cards")
                }
            }
        }.onAppear() {
            viewModel.getFriends()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .previewDisplayName("iPhone 11 Pro Max")
        MainView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}
