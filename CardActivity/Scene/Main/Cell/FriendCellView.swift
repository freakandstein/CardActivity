//
//  FriendCellView.swift
//  CardActivity
//
//  Created by satrio.wicaksono on 10/04/21.
//

import SwiftUI

struct FriendCellView: View {
    let friend: Friend
    let gradientCell: [Color] = [Color.green.opacity(0.7), Color.blue]
    
    init(friend data: Friend) {
        self.friend = data
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(friend.name ?? "").font(.title3).bold().minimumScaleFactor(0.5)
                        Text(friend.street ?? "").font(.title3).bold().minimumScaleFactor(0.5)
                    }.frame(width: 180, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                    ForEach((1...2), id: \.self) { spacer in
                        Spacer()
                    }
                    Text(friend.city ?? "").font(.title3).bold()
                        .lineLimit(1)
                        .minimumScaleFactor(1.0)
                        .frame(width: .none, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        .padding(.trailing)
                }.padding(.leading, 16)
                .background(RadialGradient(gradient: Gradient(colors: gradientCell), center: .bottomTrailing, startRadius: 100, endRadius: 250))
                .frame(width: .none, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }.frame(width: .none, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(5.0).padding(.top, 8).shadow(color: Color.gray.opacity(0.6), radius: 4, x: 0.0, y: 6.0)
//            Divider().frame(height: 4).background(Color.gray).padding(.top, -3).cornerRadius(8)
        }
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        let friend = Friend(id: 0, name: "Arjuna", street: "Arjuna Street", city: "Jakarta Barat")
        FriendCellView(friend: friend)
    }
}
