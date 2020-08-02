//
//  ColorUISlider.swift
//  GameWithHostingUIKit
//
//  Created by Anton on 02.08.2020.
//  Copyright © 2020 Anton. All rights reserved.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    
    @Binding var currentValue: Double
    var opacity: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(currentValue)
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged),
                         for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor.blue
            .withAlphaComponent(CGFloat(opacity) / CGFloat(uiView.maximumValue))
        uiView.tintColor = uiView.thumbTintColor
    }
    
    func makeCoordinator() -> ColorUISlider.Coordinator {
        Coordinator(value: $currentValue)
    }
        
}

extension ColorUISlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct ColorUISlider_Preview: PreviewProvider {
    static var previews: some View {
        ColorUISlider(currentValue: .constant(50), opacity: 50)
    }
}

