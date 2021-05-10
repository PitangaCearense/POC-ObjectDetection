//
//  ContentView.swift
//  ObjectDetectionTests
//
//  Created by Ronaldo Gomes on 07/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var results: [String] = []
    
    // Precisa do internal para esconder do construtor da struct
    internal var model = Model()
    
    // Recebe esse parametro da tela anterior
    var mlModel: MLNameModels
    
    var body: some View {
        VStack(spacing: 30) {
            
            // Botao para mudar o biding do picker
            Button("Take a picture") {
                self.showingImagePicker = true
            }
            
            // Mostra os possiveis resultados de forma dinamica
            List(results, id: \.self) {
                Text("\($0)")
            }
        }
        .navigationBarTitle("\(mlModel.rawValue)")
        
        // A partir do biding ele chama a tela fullscrenn, e quando termina ele chama a funcao do loadModelResult
        .fullScreenCover(isPresented: $showingImagePicker, onDismiss: loadModelResult) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    
    func loadModelResult() {
        // Wrap da imagem que veio da camera
        guard let inputImage = inputImage else { return }
        
        // Volta para a queue main e atualiza o resultado
        DispatchQueue.main.async {
            results = model.results(for: mlModel, image: inputImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(mlModel: MLNameModels.squeezeNet)
    }
}
