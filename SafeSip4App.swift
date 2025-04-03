//
//  SafeSip4App.swift
//  SafeSip4
//
//  Created by luciana hdez on 02/04/25.
//

import SwiftUI

@main
struct SafeSip4App: App {
    @StateObject var datos = UsuariosGlobales()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(datos)
        }
    }
}
