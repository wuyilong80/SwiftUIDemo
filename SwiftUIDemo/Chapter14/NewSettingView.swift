//
//  NewSettingView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2023/12/6.
//

import SwiftUI

struct NewSettingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedOrder: DisplayOrderType = .alphabetical
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    
    @EnvironmentObject var settingStore: SettingStore
    
    var body: some View {
        NavigationView(content: {
            Form(content: {
                Section {
                    Picker(selection: $selectedOrder) {
                        ForEach(DisplayOrderType.allCases, id: \.self) { type in
                            Text(type.stringValue)
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
                        self.settingStore.showCheckinOnly = self.showCheckInOnly
                        self.settingStore.displayOrder = self.selectedOrder
                        self.settingStore.maxPriceLevel = self.maxPriceLevel
                        dismiss()
                    }, label: {
                        Text("Save")
                    })
                }
            })
            .foregroundStyle(.black)
        })
        .onAppear(perform: {
            self.showCheckInOnly = self.settingStore.showCheckinOnly
            self.selectedOrder = self.settingStore.displayOrder
            self.maxPriceLevel = self.settingStore.maxPriceLevel
        })
    }
}

#Preview {
    NewSettingView().environmentObject(SettingStore())
}
