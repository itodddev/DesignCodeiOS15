//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/7/22.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
      NavigationView {
        List {
          Section {
            Text("Settings")
            Text("Billing")
            Text("Help")
          }
          .listRowSeparatorTint(.blue)
          .listRowSeparator(.hidden)
          
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Account")      }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
