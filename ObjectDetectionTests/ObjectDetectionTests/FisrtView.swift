//
//  FisrtView.swift
//  ObjectDetectionTests
//
//  Created by Ronaldo Gomes on 08/05/21.
//

import SwiftUI

struct FisrtView: View {
    // Todos os modelos ML disponiveis
    private var modelsNames = MLNameModels.allCases
    
    var body: some View {
        NavigationView {
            // Cria uma table view dinamica
            List(modelsNames, id: \.self) {
                Text("\($0.rawValue)")
                
                // Chama a proxima tela da navigation, como se fosse o push
                NavigationLink(destination: ContentView(mlModel: $0)) {}
            }
            .navigationBarTitle("Chose one ML Model")
        }
    }
}

struct FisrtView_Previews: PreviewProvider {
    static var previews: some View {
        FisrtView()
    }
}
