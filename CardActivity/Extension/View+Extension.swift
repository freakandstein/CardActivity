//
//  View+Extension.swift
//  CardActivity
//
//  Created by satrio.wicaksono on 11/04/21.
//

import Foundation
import SwiftUI

struct ListSeparatorNoneStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content.onAppear {
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().separatorColor = .clear
        }.onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
}

extension View {
    func listSeparatorNoneStyle() -> some View {
        modifier(ListSeparatorNoneStyle())
    }
}
