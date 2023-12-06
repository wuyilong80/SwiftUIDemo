//
//  SettingView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2023/12/6.
//

import SwiftUI

struct SettingView: View {
    
//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    private var displayOrders = [ "Alphabetical", "Show Favorite First", "Show Check-in First"]
    @State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    
    var body: some View {
        NavigationView(content: {
            Form(content: {
                Section {
                    Picker(selection: $selectedOrder) {
                        ForEach(0 ..< displayOrders.count, id: \.self) { index in
                            Text(self.displayOrders[index])
                        }
                    } label: {
                        Text("Display order")
                    }
                    .pickerStyle(.inline)
                } header: {
                    Text("SORT PREFERENCR")
                }
                Section {
                    Toggle(isOn: $showCheckInOnly, label: {
                        Text("Show Check-in Only")
                    })
                    Stepper("Show \(String(repeating: "$", count: maxPriceLevel)) or below") {
                            self.maxPriceLevel += 1
                            
                            if self.maxPriceLevel > 5 {
                                self.maxPriceLevel = 5
                            }
                    } onDecrement: {
                        self.maxPriceLevel -= 1
                        
                        if self.maxPriceLevel < 1 {
                            self.maxPriceLevel = 1
                        }

                    }
                } header: {
                    Text("FILTER PREFERENCE")
                }
                .navigationTitle("Settings")
            })
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        print("cancel")
//                        presentationMode.wrappedValue.dismiss()
                        dismiss()
                    }, label: {
                        Text("Cancel")
                            .foregroundStyle(.black)
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("save")
                    }, label: {
                        Text("Save")
                            .foregroundStyle(.black)
                    })

                }
            })
        })
    }
}

#Preview {
    SettingView()
}
