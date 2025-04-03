import SwiftUI

struct DatosPersonales: View {
    @EnvironmentObject var datos: UsuariosGlobales
    
    private var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.zeroSymbol = ""
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) { // Espaciado entre elementos
                Text("DATOS PERSONALES")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                
                TextField("Nombre Completo", text: $datos.nombre_usuario)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 30)

                TextField("Edad", value: $datos.edad_usuario, formatter: numberFormatter)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 30)

                TextField("Peso (Kilogramos)", value: $datos.peso_usuario, formatter: numberFormatter)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 30)

                TextField("Sexo (Femenino o Masculino)", text: $datos.sexo_usuario)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 30)
                
                NavigationLink("Todo listo!", destination: SegundaVista().environmentObject(datos))
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Hace que el VStack ocupe toda la pantalla
        }
    }
}

