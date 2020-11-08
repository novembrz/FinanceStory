//
//  RealmModel.swift
//  FinanceStory
//
//  Created by Дарья on 08.11.2020.
//

import Foundation
import RealmSwift

class RevenueFinanceModel: Object {
    @objc dynamic var name = ""
    @objc dynamic var revenue = 0
}

class ExpensesFinanceModel: Object { // либо только это оставить 
    @objc dynamic var name = ""
    @objc dynamic var expense = 0
    @objc dynamic var category = ""
    @objc dynamic var isFavourite = false
}

class MyGoalModel {
    @objc dynamic var name = ""
    @objc dynamic var balance = 0
    @objc dynamic var color = ""
    @objc dynamic var month = 0
}
