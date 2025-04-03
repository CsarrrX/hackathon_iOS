import SwiftUI

struct DetallesBebida: View {
    let bebida: Bebida

    var body: some View {
        VStack(spacing: 20) {
            Text(bebida.nombre)
                .font(.largeTitle)
                .bold()
            Text("Graduación alcohólica: \(bebida.graduacion, specifier: "%.1f")%")
                .font(.title2)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding()
    }
}


