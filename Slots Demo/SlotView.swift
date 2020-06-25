//
//  SlotView.swift
//  Slots Demo
//
//  Created by Guilherme Crozariol on 2020-06-25.
//  Copyright © 2020 Guilherme Crozariol. All rights reserved.
//

import SwiftUI

struct SlotView: View {
    
    var slotImages = ["donut", "lemon", "apple"]
    @Binding var slotPosition: Int
    
    var body: some View {
        Image(slotImages[slotPosition])
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .background(Color.white)
            .cornerRadius(20)
    }
}

struct SlotView_Previews: PreviewProvider {
    static var previews: some View {
        SlotView(slotPosition: Binding.constant(0))
    }
}
