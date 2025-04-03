import SwiftUI

struct HomeView: View {
    @EnvironmentObject var datos: UsuariosGlobales
    @State private var likes: [String: Int] = [:]
    @State private var comentarios: [String: [String]] = [:]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Text("SAFE SIP")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    Spacer()
                }
                .padding()
                .background(Color.white)

                ScrollView {
                    VStack(spacing: 20) {
                        PostView(
                            titulo: "Ley Seca en Puebla",
                            imagen: "ley_seca",
                            likes: $likes,
                            comentarios: $comentarios
                        )
                        PostView(
                            titulo: "Top Bebidas Favoritas",
                            imagen: "bebidas",
                            likes: $likes,
                            comentarios: $comentarios
                        )
                        PostView(
                            titulo: "¿Cuánto alcohol es seguro?",
                            imagen: "noticia2",
                            likes: $likes,
                            comentarios: $comentarios
                        )
                        PostView(
                            titulo: "Consejos para beber responsablemente",
                            imagen: "noticia3",
                            likes: $likes,
                            comentarios: $comentarios
                        )
                    }
                    .padding(.horizontal)
                }

            }
            .navigationTitle("Inicio")
        }
    }
}

struct PostView: View {
    let titulo: String
    let imagen: String
    @Binding var likes: [String: Int]
    @Binding var comentarios: [String: [String]]

    var body: some View {
        VStack(alignment: .leading) {
            Text(titulo)
                .font(.headline)
                .bold()
                .padding(.bottom, 5)

            Image(imagen)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(10)

            HStack {
                Button(action: {
                    likes[titulo, default: 0] += 1
                }) {
                    HStack {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                        Text("\(likes[titulo, default: 0])")
                    }
                }
                Spacer()
                NavigationLink(destination: ComentariosView(titulo: titulo, comentarios: $comentarios)) {
                    HStack {
                        Image(systemName: "message.fill")
                        Text("\(comentarios[titulo]?.count ?? 0)")
                    }
                }
            }
            .padding(.top, 5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}


struct ComentariosView: View {
    let titulo: String
    @Binding var comentarios: [String: [String]]
    @State private var nuevoComentario: String = ""

    var body: some View {
        VStack {
            List {
                ForEach(comentarios[titulo] ?? [], id: \.self) { comentario in
                    Text(comentario)
                }
            }
            HStack {
                TextField("Escribe un comentario...", text: $nuevoComentario)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Enviar") {
                    comentarios[titulo, default: []].append(nuevoComentario)
                    nuevoComentario = ""
                }
            }
            .padding()
        }
        .navigationTitle("Comentarios")
    }
}


struct IconoNav: View {
    let icono: String
    let texto: String

    var body: some View {
        VStack {
            Image(systemName: icono)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            Text(texto)
                .font(.caption)
        }
    }
}



