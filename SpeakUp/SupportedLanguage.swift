//
//  File.swift
//  SpeakUp
//
//  Created by Jacek Kosinski U on 01/11/2022.
//

import Foundation


struct SupportedLanguage: Hashable{
    let code: String?
    let name: String?
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(code)
      hasher.combine(name)
    }
}
