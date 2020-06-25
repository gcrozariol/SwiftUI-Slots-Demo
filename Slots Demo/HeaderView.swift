//
//  HeaderView.swift
//  Slots Demo
//
//  Created by Guilherme Crozariol on 2020-06-25.
//  Copyright © 2020 Guilherme Crozariol. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .font(.largeTitle)
                .foregroundColor(.orange)
            Text("SwiftUI Slots")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.white)
            Image(systemName: "star.fill")
                .font(.largeTitle)
                .foregroundColor(.orange)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
