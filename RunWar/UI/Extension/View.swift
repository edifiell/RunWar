//
//  View.swift
//  RunWar
//
//  Created by @IBaction on 02.11.2021.
//

import SwiftUI

extension View {
    func toast(isShowing: Binding<Bool>, duration: TimeInterval = 3) -> some View {
        modifier(ToastModifier(isShowing: isShowing, duration: duration))
    }
}
