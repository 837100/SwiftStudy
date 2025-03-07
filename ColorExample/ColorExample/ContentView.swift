//
//  ContentView.swift
//  ColorExample
//
//  Created by NO SEONGGYEONG on 3/6/25.
//

import SwiftUI

struct ContentView: View {
    let rectColor: UIColor = UIColor(hue: 0.3, saturation: 0.2, brightness: 1, alpha: 1)
    let rectColor2: Color = Color(hue: 0.3, saturation: 0.3, brightness: 0.8)
    var body: some View {
        VStack{
//            Rectangle().fill(Color(uiColor: rectColor))
            Rectangle().fill(rectColor2)
        }
    }
}

#Preview {
    ContentView()
}
