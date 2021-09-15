//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 13.09.2021.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    @State private var showAlert = false
    @AppStorage("user") private var userName = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $userName)
                    .multilineTextAlignment(.center)
                Text("\(userName.count)")
                    .foregroundColor(.green)
                Spacer()
            }
            .padding()
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Wrong!"), message: Text("You need to enter more than 3 characters!")
                            )
                        }
                }
                .disabled(userName.isEmpty)
            }
        }
    }
    private func registerUser() {
        if userName.count >= 3 {
            user.name = userName
            user.isRegister.toggle()
        } else {
            showAlert.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
