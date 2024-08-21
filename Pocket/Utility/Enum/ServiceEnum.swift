//
//  ServiceEnum.swift
//  Pocket
//
//  Created by BS01550 on 21/8/24.
//

import Foundation

public enum FeatureMenu: String {
    case sendMoney = "M_101"
    case payment = "M_102"
    case recharge = "M_104"
    case remittance = "M_105"
    case request = "M_106"
    case addMoney = "ADD_MONEY"
    case electricity = "M_ELEC203"
    case gas = "M_GAS203"
    case transfer = "M_SM101"
    case water = "M_WTR203"
    case internet = "M_INT203"
    case education = "M_EDU1020"
    case news = "M_NEWS"
    case ewpd = "M_EWPD"
    case govtPay = "M_GOVTPAY"
    
    public var title: String {
        switch self {
        case .sendMoney : "Send Money"
        case .payment : "Payment"
        case .recharge : "Recharge"
        case .remittance: "Remittance"
        case .request: "Request"
        case .addMoney : "Add Money"
        case .electricity: "Electricity"
            
        case .gas: "Gas"
        case .transfer: "Transfer"
        case .water: "Water"
        case .internet: "Internet"
        case .education: "Education"
        case .news: "News"
        case .ewpd: "EWPD"
        case .govtPay: "Govt Pay"
        //default: ""
        }
    }
    
    public var iconImage: String {
        switch self {
        case .sendMoney : "Type=Send Money"
        case .addMoney : "Type=Add Money"
        case .payment : "Type=Bill Payment"
        case .recharge : "Type=Mobile Recharge"
        case .education : "Type=Education Fee"
        case .remittance : "Type=Remittance"
        case .request : "Type=Request Money"
        case .transfer : "Type=Transfer"
        case .internet: "Type=Internet"
        case .electricity: "Type=Electricity"
        case .water: "Type=WASA"
        case .gas : "Type=Gas"
        case .news : "Type=News"
        case .ewpd : "Type=EWPD"
        case .govtPay : "Type=Gov"
        //default: ""
        }
    }
}
