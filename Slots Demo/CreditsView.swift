//
//  CreditsView.swift
//  Slots Demo
//
//  Created by Guilherme Crozariol on 2020-06-25.
//  Copyright © 2020 Guilherme Crozariol. All rights reserved.
//

import SwiftUI

struct CreditsView: View {
    
    @Binding var credits: Int
    
    var body: some View {
        Text("Credits: \(credits)")
            .foregroundColor(.black)
            .frame(width: 150, height: 50, alignment: .center)
            .background(Color.white)
            .cornerRadius(50)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView(credits: Binding.constant(0))
    }
}
