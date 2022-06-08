//
//  ContentView.swift
//  SetupXcodeCloud
//
//  Created by Paul Peelen on 2022-06-07.
//

import SwiftUI

struct ContentView: View {
    private let nameManager = NameManager()
    @State private var usersName: String = ""

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            if usersName != "" {
                Text("Hello, \(usersName)!")
            } else {
                Text("Hello, world!")
            }
            HStack {
                TextField("Enter your name here, and submit.", text: $usersName)
                    .onSubmit {
                        nameManager.setName(usersName)
                    }
                    .multilineTextAlignment(.center)
                    .disableAutocorrection(true)
            }
        }
        .onAppear {
            usersName = nameManager.usersName ?? ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
