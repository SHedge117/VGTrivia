//
//  htmlString.swift
//  VGTrivia
//
//  Created by Shawn D. Hedgepeth on 11/18/20.
//  Copyright © 2020 Shawn D. Hedgepeth. All rights reserved.
//

import Foundation

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    func convertToAttributedString() -> NSAttributedString? {
        let modifiedFontString = "<span style=\"font-family: Lato-Regular; font-size: 30; color: rgb(60, 60, 60)\">" + self + "</span>"
        return modifiedFontString.htmlToAttributedString
    }
}
