import SwiftUI

struct DetallesBebidaSheet: View {
    @EnvironmentObject var datos: UsuariosGlobales
    let bebida: Bebida
    
    func formulaAlcohol() -> Double {
        var indiceGenero = 0.6
        let primerCaracter = datos.sexo_usuario.lowercased().first
        if primerCaracter == "m" {
            indiceGenero = 0.7
        }
        
        guard datos.peso_usuario > 0 else { return 0 }
        
        return (((bebida.graduacion * 60 * 0.8) / 100) * indiceGenero) / datos.peso_usuario
    }

    var body: some View {
        VStack(spacing: 20) {
            // Título sin bordes, alineado a la izquierda
            Text(bebida.nombre)
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.leading, 20)

            // Cálculos y detalles de la bebida
            let porcentajeresultado = formulaAlcohol()
            
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text("Graduación:")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(bebida.graduacion, specifier: "%.1f")%")
                        .bold()
                        .foregroundColor(.red)
                }
                
                HStack {
                    Text("Alcoholemia por 60ml (shot):")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(porcentajeresultado, specifier: "%.1f")%")
                        .bold()
                        .foregroundColor(.red)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
        .presentationDetents([.fraction(0.3), .medium, .large])
        .presentationDragIndicator(.visible)
    }
}

struct BebidaGridView: View {
    let bebidas: [Bebida]
    @Binding var bebidaSeleccionada: Bebida?
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2) // Dos columnas
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(bebidas) { bebida in
                Button(action: {
                    bebidaSeleccionada = bebida
                }) {
                    VStack {
                        AsyncImage(url: URL(string: bebida.imagenURL)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .padding(10)
                            } else if phase.error != nil {
                                Text("Error al cargar imagen")
                                    .foregroundColor(.red)
                                    .padding()
                            } else {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .red))
                                    .padding()
                            }}
                            
                            Text(bebida.nombre)
                                .foregroundColor(.red)
                                .bold()
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .padding(.top, 5)
                                .font(.body)
                        }
                        .frame(width: 150, height: 150) // Botones con más espacio
                        .background(Color.white)
                        .cornerRadius(10) // Borde más pequeño
                        .shadow(radius: 5) // Sombra suave similar a HomeView
                    }
                }
            }
            .padding(.top, 10)
        }
    }
    
    struct RegistroView: View {
        let bebidas = DatosBebidas.lista
        @State private var bebidaSeleccionada: Bebida?
        
        var body: some View {
            NavigationStack {
                GeometryReader { geometry in
                    VStack {
                        // Título sin borde, alineado a la izquierda y en rojo
                        Text("Bebidas Disponibles")
                            .font(.title)
                            .bold()
                            .foregroundColor(.red) // Título en rojo
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Contenedor para las bebidas con un fondo sutil y desplazable
                        ScrollView {
                            VStack {
                                BebidaGridView(bebidas: bebidas, bebidaSeleccionada: $bebidaSeleccionada)
                                Spacer()
                            }
                            .frame(width: geometry.size.width * 0.9) // Control de ancho
                            .padding(.top, 10)
                        }
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        .ignoresSafeArea(edges: .horizontal)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .navigationTitle("Bebidas")
                .sheet(item: $bebidaSeleccionada) { bebida in
                    DetallesBebidaSheet(bebida: bebida)
                }
            }
        }
    }
    

