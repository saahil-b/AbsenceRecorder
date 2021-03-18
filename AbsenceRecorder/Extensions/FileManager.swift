//
//  FileManager.swift
//  AbsenceRecorder
//
//  Created by Rakesh Bahadur on 18/03/2021.
//

import Foundation

extension FileManager {
    
    private func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func save<T: Codable>(to filePath: String, object: T) {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(object) {
            if let json = String(data: encoded, encoding: .utf8) {
                
                let url = getDocumentDirectory().appendingPathComponent(filePath)
                
                do {
                    try json.write(to: url, atomically: true, encoding: .utf8)
                    
                } catch {
                    print(error.localizedDescription)
                    
                }
            }
        }
    }
    
    func load<T: Codable>(from filepath: String) -> T? {
        let url = getDocumentDirectory().appendingPathComponent(filepath)
        if let data =  try? Data(contentsOf: url ) {
            let decoder = JSONDecoder()
            
            if let loaded = try? decoder.decode(T.self, from: data) {
                return loaded
                
            } else {
                print("failed to decode")
                return nil
            }
            
        } else {
            
            print("Couldn't find file at given path")
            return nil
            
        }
    }
    
}
