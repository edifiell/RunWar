//
//  ContentView.swift
//  RunWar
//
//  Created by @IBaction on 01.11.2021.
//  

import SwiftUI

struct MainVC: View {
    private let vm = MainVM()
    @State var speed = ""
    @State var newDate = Date()
    @State private var isShowingToast = false

    var body: some View {
        let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
            VStack {
                Text(speed)
                        .onReceive(timer) { _ in
                            speed = vm.speed
                        }
                        .font(SwiftUI.Font.title)
                        .padding(160)
                Button {
                    vm.action()
                    speed = vm.speed
                    isShowingToast = true

                } label: {
                    Text("Start")
                }
                .font(SwiftUI.Font.title)
            }
            .toast(isShowing: $isShowingToast)
        //MARK: ViewDidLoad
        .onAppear {
            print("Chida")
            vm.viewDidLoad()
            speed = vm.speed
        }
    }
}
struct MainVC_Previews: PreviewProvider {
    static var previews: some View {
        MainVC()
    }
}
