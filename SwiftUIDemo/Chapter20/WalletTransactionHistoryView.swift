//
//  WalletTransactionHistoryView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/8/1.
//

import SwiftUI

struct WalletTransactionHistoryView: View {
    
    var transactions: [WalletTransaction]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Transaction History")
                .font(.system(size: 25, weight: .black, design: .rounded))
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(transactions) { transaction in
                        WalletTransactionView(transaction: transaction)
                    }
                }
                .padding()
            }
        }
    }
}

struct WalletTransactionView: View {
    
    var transaction: WalletTransaction
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(UIColor.systemGray5))
            .overlay(
                VStack {
                    Spacer()
                    
                    Image(systemName: transaction.icon)
                        .font(.system(size: 50))
                        .padding(.bottom, 10)
                    
                    Text(transaction.merchant)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    Text("$\(String(format: "%.1f", transaction.amount))")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .padding(.bottom, 30)
                    
                    Text(transaction.date)
                        .font(.system(.caption, design: .rounded))
                    
                    Spacer()
                }
                    
            )
            .frame(width: 200, height: 300)
            
    }
}

#Preview {
    WalletTransactionHistoryView(transactions: testTransactions)
}
