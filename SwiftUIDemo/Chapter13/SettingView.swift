//
//  SettingView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2023/12/6.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    private var displayOrders = [ "Alphabetical", "Show Favorite First", "Show Check-in First"]
    @State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
//    
//    @EnvironmentObject var settingStore: SettingStore
    
    var body: some View {
        NavigationView(content: {
            Form(content: {
                Section {
                    Picker(selection: $selectedOrder) {
                        ForEach(0 ..< displayOrders.count, id: \.self) { index in
                            Text(self.displayOrders[index])
                        }
                    } label: {
                        Text("Display Order")
                    }
                } header: {
                    Text("SORT PREFERENCE")
                }
                
                Section {
                    Toggle(isOn: $showCheckInOnly) {
                        Text("Show Check-in only")
                    }
                    
                    Stepper(
                        onIncrement: {
                            self.maxPriceLevel += 1
                            if self.maxPriceLevel > 5 {
                                self.maxPriceLevel = 5
                            }
                        },
                        onDecrement: {  
                            self.maxPriceLevel -= 1
                            if self.maxPriceLevel < 0 {
                                self.maxPriceLevel = 0
                            }
                        },
                        label: {
                            Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
                        })

                } header: {
                    Text("FILTER PREFERENCE")
                }
            })
            .navigationTitle("Settings")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Save")
                    })
                }
            })
            .foregroundStyle(.black)
        })
    }
}

#Preview {
    SettingView().environmentObject(SettingStore())
}
