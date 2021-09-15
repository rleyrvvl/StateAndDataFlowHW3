//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by brubru on 13.09.2021.
//

import Combine

class UserManager: ObservableObject {
    @Published var isRegister = false
    var name = ""
}
