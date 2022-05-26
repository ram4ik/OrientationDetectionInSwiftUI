//
//  ContentView.swift
//  OrientationDetectionInSwiftUI
//
//  Created by Ramill Ibragimov on 26.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var orientation = UIDevice.current.orientation
    
    var body: some View {
        VStack {
            if orientation.isLandscape {
                HStack {
                    Image(systemName: "heart.fill")
                    Text("Detect Orientation")
                    Image(systemName: "heart.fill")
                }
                .font(.largeTitle)
                .foregroundColor(.purple)
            } else {
                VStack {
                    Image(systemName: "heart.fill")
                    Text("Detect Orientation")
                    Image(systemName: "heart.fill")
                }
                .font(.largeTitle)
                .foregroundColor(.purple)
            }
        }
        .detectOrientation($orientation)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DetectOrientation: ViewModifier {
    
    @Binding var orientation: UIDeviceOrientation
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                orientation = UIDevice.current.orientation
            }
    }
}

extension View {
    func detectOrientation(_ orientation: Binding<UIDeviceOrientation>) -> some View {
        modifier(DetectOrientation(orientation: orientation))
    }
}
