import SwiftUI

struct SegundaVista: View{
    var body: some View {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                            .imageScale(.medium)
                        Text("Inicio")
                    }
                
                RegistroView()
                    .tabItem {
                        Image(systemName: "text.book.closed.fill")
                        Text("Registro")
                    }
                
                PerfilView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Perfil")
                    }
                
                   
                
               
            }
            .navigationBarBackButtonHidden(true)
            .accentColor(.red) // Color de los iconos seleccionados
        }
}
