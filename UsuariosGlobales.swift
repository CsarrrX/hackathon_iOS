import SwiftUI

class UsuariosGlobales: ObservableObject {
    @Published var nombre_usuario: String = ""
    @Published var peso_usuario: Double = 10
    @Published var edad_usuario: Double = 0.0
    @Published var sexo_usuario: String = ""
    @Published var resultado: Double = 0.0
}




