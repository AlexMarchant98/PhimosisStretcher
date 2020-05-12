//
//  PSSecondaryButton.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming

class PSSecondaryButton: MDCButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setBackgroundColor(UIColor.clear)
        self.setBorderColor(UIColor.appGreen, for: .normal)
        self.setTitleFont(Fonts.buttonFont, for: .normal)
        self.setTitleColor(UIColor.appGreen, for: .normal)
        self.isUppercaseTitle = false
    }

}
