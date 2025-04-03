import SwiftUI

struct Bebida: Identifiable {
    let id = UUID()
    let nombre: String
    let graduacion: Double
    let imagenURL: String
}

struct DatosBebidas {
    static let lista: [Bebida] = [
        Bebida(nombre: "Cerveza", graduacion: 5, imagenURL: "https://img.freepik.com/psd-premium/cerveza-espumosa-vaso-aislado-fondo-transparente_927015-1947.jpg?w=900"),
        Bebida(nombre: "Vino blanco", graduacion: 12.5, imagenURL: "https://img.freepik.com/psd-gratis/botella-vino-rojo-bebida-elegante-vidrio_84443-42802.jpg?t=st=1743666332~exp=1743669932~hmac=110fd1024f4f79a4db4507797a11677656f5ba7177d620c8be12e79863adf702&w=1380"),
        Bebida(nombre: "Vino tinto", graduacion: 13.5, imagenURL: "https://img.freepik.com/fotos-premium/copa-vino-blanco_159938-782.jpg?w=826"),
        Bebida(nombre: "Baileys", graduacion: 17, imagenURL: "https://img.freepik.com/foto-gratis/coctel-brandy-alexander-clasico_123827-22412.jpg?t=st=1743666585~exp=1743670185~hmac=e036f255db04f72083fb25de48d1d4698349e371be8658b7da39b21e5dd219ef&w=826"),
        Bebida(nombre: "Brandy", graduacion: 36, imagenURL: "https://img.freepik.com/foto-gratis/whisky-rocas-fondo-negro_53876-97252.jpg?t=st=1743666694~exp=1743670294~hmac=a120ce6e8e46d7d8d598e5bb092512173ff656deb4472560f437eb1df86c7e86&w=1380"),
        Bebida(nombre: "Ron blanco", graduacion: 37, imagenURL: "https://img.freepik.com/psd-gratis/whiskey-disparado-vidrio-transparente-liquido-ambar-bebida-fuerte_632498-46105.jpg?t=st=1743666800~exp=1743670400~hmac=9d59eb3620d6cf39c2c3437f4edc19c48140bfd0e42009b661e3d7e87a507b7c&w=1380"),
        Bebida(nombre: "Ginebra rosa", graduacion: 37.5, imagenURL: "https://img.freepik.com/foto-gratis/coctel-pomelo-aislado-sobre-fondo-blanco_123827-33377.jpg?t=st=1743666824~exp=1743670424~hmac=78ce70f7430734d27a61b7d0456654a80202fdc8673d87dce5e6bc42e873f41d&w=826"),
        Bebida(nombre: "Tequila", graduacion: 38, imagenURL: "https://img.freepik.com/foto-gratis/vista-frontal-tequila-dorado-limon-sal_23-2148673704.jpg?t=st=1743666848~exp=1743670448~hmac=f9255e6501e18f0eaf400ea74b05df7a7a3bc417cdccbefb25729dd8e67df121&w=1800"),
        Bebida(nombre: "Ron negro", graduacion: 40, imagenURL: "https://img.freepik.com/foto-gratis/vista-frontal-tequila-dorado-limon-sal_23-2148673704.jpg?t=st=1743666848~exp=1743670448~hmac=f9255e6501e18f0eaf400ea74b05df7a7a3bc417cdccbefb25729dd8e67df121&w=1800"),
        Bebida(nombre: "Vodka", graduacion: 40, imagenURL: "https://img.freepik.com/fotos-premium/botella-vodka-vaso-vino-limon-aislado-blanco_392895-568647.jpg?w=826"),
        Bebida(nombre: "Whisky", graduacion: 45, imagenURL: "https://img.freepik.com/foto-gratis/whisky-rocas-fondo-negro_53876-100105.jpg?t=st=1743666962~exp=1743670562~hmac=417a5585a272b6ad8fbc5e1c1e535fb36289b438f0e55f275030069db28c0bf9&w=826"),
        Bebida(nombre: "Mezcal", graduacion: 37, imagenURL: "https://img.freepik.com/foto-gratis/vida-muerta-mezcal-gusano-maguey_23-2151267864.jpg?t=st=1743666999~exp=1743670599~hmac=cabdcd466330c51ffce80421baefb91fa25f919e303055177f7d5949643780c8&w=826")
    ]
}

