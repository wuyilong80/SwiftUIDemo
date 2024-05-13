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
    
//    private var displayOrders = [ "Alphabetical", "Show Favorite First", "Show Check-in First"]
    @State private var selectedOrder = DisplayOrderType.alphabetical
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    
    @EnvironmentObject var settingStore: SettingStore
    
    var body: some View {
        NavigationView(content: {
            Form(content: {
                Section {
                    Picker(selection: $selectedOrder) {
                        ForEach(DisplayOrderType.allCases, id: \.self) { orderType in
                            Text(orderType.stringValue)
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
                        self.settingStore.showCheckinOnly = self.showCheckInOnly
                        self.settingStore.displayOrder = self.selectedOrder
                        self.settingStore.maxPriceLevel = self.maxPriceLevel
                            dismiss()
                    }, label: {
                        Text("Save")
                            .foregroundStyle(.black)
                    })

                }
            })
        })
        .onAppear(perform: {
            self.selectedOrder = self.settingStore.displayOrder
            self.showCheckInOnly = self.settingStore.showCheckinOnly
            self.maxPriceLevel = self.settingStore.maxPriceLevel
        })
    }
}

#Preview {
    SettingView().environmentObject(SettingStore())
}
