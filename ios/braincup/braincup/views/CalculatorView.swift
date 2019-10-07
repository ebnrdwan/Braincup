//
//  CalculatorView.swift
//  braincup
//
//  Created by Simon Schubert on 05.10.19.
//  Copyright © 2019 Simon Schubert. All rights reserved.
//

import SwiftUI

struct CalculatorView: View {
    var showOperators = false
    var onInputChange: (String) -> Void
    @State var calculation = ""
    
    func changeValue(value: String) -> Void {
        calculation += value
        onInputChange(calculation)
    }
    
    func deleteValue() -> Void {
        if(calculation.count > 0) {
            calculation = String(calculation.prefix(calculation.count-1))
        }
        onInputChange(calculation)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(calculation).frame(height: 50)
                if(calculation.count > 0) {
                    Button(action: {self.deleteValue()}) {
                        Text("<").foregroundColor(Color(hex: 0xFFED7354))
                    }
                }
            }
            HStack {
                NumberPadButton(value: "7", onInputChange: {value in self.changeValue(value: value)})
                NumberPadButton(value: "8", onInputChange: {value in self.changeValue(value: value)})
                NumberPadButton(value: "9", onInputChange: {value in self.changeValue(value: value)})
                if(showOperators) {
                    NumberPadButton(value: "/", onInputChange: {value in self.changeValue(value: value)})
                }
            }
            HStack {
                NumberPadButton(value: "4", onInputChange: {value in self.changeValue(value: value)})
                NumberPadButton(value: "5", onInputChange: {value in self.changeValue(value: value)})
                NumberPadButton(value: "6", onInputChange: {value in self.changeValue(value: value)})
                if(showOperators) {
                    NumberPadButton(value: "*", onInputChange: {value in self.changeValue(value: value)})
                }
            }
            HStack {
                NumberPadButton(value: "3", onInputChange: {value in self.changeValue(value: value)})
                NumberPadButton(value: "2", onInputChange: {value in self.changeValue(value: value)})
                NumberPadButton(value: "1", onInputChange: {value in self.changeValue(value: value)})
                if(showOperators) {
                    NumberPadButton(value: "-", onInputChange: {value in self.changeValue(value: value)})
                }
            }
            HStack {
                if(showOperators) {
                    NumberPadButton(value: "(", onInputChange: {value in self.changeValue(value: value)})
                }
                NumberPadButton(value: "0", onInputChange: {value in self.changeValue(value: value)})
                if(showOperators) {
                    NumberPadButton(value: ")", onInputChange: {value in self.changeValue(value: value)})
                }
                if(showOperators) {
                    NumberPadButton(value: "+", onInputChange: {value in self.changeValue(value: value)})
                }
            }
        }
    }
}

struct NumberPadButton: View {
    var value = ""
    var onInputChange: (String) -> Void
    
    var body: some View {
        Button(action: {self.onInputChange(self.value)}) {
            Text(value)
        }.buttonStyle(NumpadButtonStyle())
    }
}
