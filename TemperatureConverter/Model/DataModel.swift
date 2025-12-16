//
//  DataModel.swift
//  AvanzaBroadcasting
//
//  Created by Cesar Ibarra on 2/15/22.
//

import Foundation
import SwiftUI

struct ImageBackground: Codable {
    var name: String
}

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}

func getRandomImageName() -> String {
    let images: [ImageBackground] = Bundle.main.decode([ImageBackground].self, from: "image.json")
    return images.randomElement()?.name ?? "image-5" // Usa "image-5" como fallback
}
