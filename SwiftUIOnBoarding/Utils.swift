//
//  Utils.swift
//  SwiftUIOnBoarding
//
//  Created by Lucas Spusta on 7/10/20.
//

import UIKit
import SwiftUI

struct PageView: View {
    var title: String
    var imageName: String
    var header: String
    var content: String
    var textColor: Color

    let imageWidth: CGFloat = 150
    let textWidth: CGFloat = 350

    var body: some View {
        let size = UIImage(named: imageName)!.size
        let aspect = size.width / size.height

        return
            VStack(alignment: .center, spacing: 50) {
                Text(title)
                    .font(Font.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(textColor)
                    .frame(width: textWidth)
                    .multilineTextAlignment(.center)
                Image(imageName)
                    .resizable()
                    .aspectRatio(aspect, contentMode: .fill)
                    .frame(width: imageWidth, height: imageWidth)
                    .cornerRadius(40)
                    .clipped()
                VStack(alignment: .center, spacing: 5) {
                    Text(header)
                        .font(Font.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(textColor)
                        .frame(width: 300, alignment: .center)
                        .multilineTextAlignment(.center)
                    Text(content)
                        .font(Font.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(textColor)
                        .frame(width: 300, alignment: .center)
                        .multilineTextAlignment(.center)
                }
            }.padding(60)
    }
}

struct MockData {
    static let title = "SwiftUI 101"
    static let headers = [
        "Step 1",
        "Step 2",
        "Step 3",
        "Step 4",
    ]
    static let contentStrings = [
        "Create your code.",
        "Get a code error.",
        "Go to stackoverflow.",
        "Fix your error."
    ]
    static let imageNames = [
        "screen 1",
        "screen 2",
        "screen 3",
        "screen 4"
    ]

    static let colors = [
        "F38181",
        "FCE38A",
        "95E1D3",
        "EAFFD0"
        ].map{ Color(hex: $0) }

    static let textColors = [
        "FFFFFF",
        "4A4A4A",
        "4A4A4A",
        "4A4A4A"
        ].map{ Color(hex: $0) }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff


        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}
