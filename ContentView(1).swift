import SwiftUI

struct ContentView: View {
   
    var body: some View{
        DatosPersonales()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UsuariosGlobales())
    }
}

