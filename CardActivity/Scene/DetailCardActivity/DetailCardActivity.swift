//
//  DetailCardActivity.swift
//  CardActivity
//
//  Created by satrio.wicaksono on 16/03/21.
//

import SwiftUI

struct DetailCardActivity: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            Color(.cyan)
            VStack(alignment: .center) {
                Image("PictureMe")
                    .resizable()
                    .cornerRadius(8)
                    .scaledToFit()
                    .frame(width: 120, height: 160, alignment: .top)
                Label("Satrio Wicaksono", image: "").frame(width: .none, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                HStack(alignment: .top) {
                    Text("Ingarso Sungtulodo Ingmadya Mangunkarsa, Tutwuri handayani, Ingarso Sungtulodo Ingmadya Mangunkarsa, Tutwuri handayani, Ingarso Sungtulodo Ingmadya Mangunkarsa, Tutwuri handayani, Ingarso Sungtulodo Ingmadya Mangunkarsa, Tutwuri handayani, Ingarso Sungtulodo Ingmadya Mangunkarsa, Tutwuri handayani, Ingarso Sungtulodo Ingmadya Mangunkarsa, Tutwuri handayani, Ingarso Sungtulodo Ingmadya Mangunkarsa, Tutwuri handayani, Ingarso Sungtulodo Ingmadya Mangunkarsa, Tutwuri handayani, Ingarso Sungtulodo Ingmadya Mangunkarsa, Tutwuri handayani, Ingarso Sungtulodo Ingmadya Mangunkarsa, Tutwuri handayani, Ingarso Sungtulodo Ingmadya Mangunkarsa, Tutwuri handayani").baselineOffset(4).padding(.leading, 4)
                }.padding(.top, 32)
            }.padding(.top,120)
        }.frame(width: .none, height: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).edgesIgnoringSafeArea([.top, .bottom])
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Back")
        }))
    }
}

struct DetailCardActivity_Previews: PreviewProvider {
    static var previews: some View {
        DetailCardActivity()
    }
}
