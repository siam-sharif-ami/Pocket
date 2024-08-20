//
//  Transactions.swift
//  Pocket
//
//  Created by BS00484 on 6/8/24.
//

import Foundation
import UIKit

struct Transaction {
    var icon: String
    var title: String
    var amount: Int
    var date: String
    var type: String
}

var transactionsOnTableView = [
    Transaction(icon: "Type=Send Money", title: "Transfer to UCB **** 1234 Transfer to UCB **** 1234", amount: 1000000000000, date: "22/04/24", type: "debit"),
    Transaction(icon: "Type=Request Money", title: "Money added from UCB **** 2345 Money added from UCB **** 2345", amount: 3000000000, date: "06/08/24", type: "credit"),
    Transaction(icon: "Type=Bill Payment", title: "Make Payment to Apon Mart Make Payment to Apon Mart", amount: 6900000, date: "05/08/24", type: "debit"),
    Transaction(icon: "Type=Request Money", title: "Money added from UCB **** 4567 Money added from UCB **** 4567", amount: 20000, date: "06/08/24", type: "credit")
]
