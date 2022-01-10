//
//  HourGlassLoaderView.swift
//  Pielgrzym
//
//  Created by Tymoteusz Stokarski on 08/01/2022.
//

import SwiftUI
import Lottie

protocol LottieAnimationProtocol {
    
    var animationView: AnimationView { get set }
    
}

struct HourGlassLoaderView: UIViewRepresentable, LottieAnimationProtocol {
    
    var animationView = AnimationView()

    func makeUIView(context: UIViewRepresentableContext<HourGlassLoaderView>) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        animationView.animation = Animation.named("Hourglass")
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.play()
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }
    
    private mutating func animate() {
        animationView.play()
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<HourGlassLoaderView>) {
        print("animate")
        context.coordinator.parent.animate()
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: HourGlassLoaderView

        init(_ parent: HourGlassLoaderView) {
            self.parent = parent
        }
    }
    
}
