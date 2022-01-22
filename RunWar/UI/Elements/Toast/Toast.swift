//
//  ToastVC.swift
//  RunWar
//
//  Created by @IBaction on 02.11.2021.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var isShowing: Bool
    let duration: TimeInterval
    func body(content: Content) -> some View {
        ZStack {
            content
            if isShowing {
                toast
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            withAnimation {
                                isShowing = false
                            }
                        }
                    }
            }
        }
    }
    private var toast: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "heart.fill")
                Text("Run is active")
                    .font(.footnote)
                Spacer()

            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(5)
            .shadow(radius: 5)
        }
        .padding()
    }
}
