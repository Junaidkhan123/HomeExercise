//
//  UILabel + Ext.swift
//  HomeExercise
//
//  Created by Junaid on 12/07/2022.
//

import UIKit
extension UILabel {
    func addImageTOLeft(of image: UIImage, text:String ) {
        let attachment = NSTextAttachment()
        attachment.image = image


        let attachmentString = NSAttributedString(attachment: attachment)
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentString)

        let string = NSMutableAttributedString(string: text, attributes: [:])
        mutableAttributedString.append(string)
        self.attributedText = mutableAttributedString
    }
}
