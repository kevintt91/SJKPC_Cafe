//
//  Customer.swift
//  Cafe_Practice
//
//  Created by 김창현 on 3/30/23.
//

import Foundation

struct Customer {
    let customerName: String
    let boozerNumber: String
    let coffeeOrders: [Order]
}


/*
 한 사람이 오더를 커피 하나만 한다
    -> 그 사람의 이름, 오더번호, 커피 디테일(아아 한잔)
 한 사람이 오더를 여러개 한다(아아 1, 아라 1)
    -> 그 사람의 이름, 오더번호, 커피 디테일(아아 한잔, 아라 한잔)
 [
    주문자 이름,
    부저 번호,
    [
        음료 1
    ],
     [
         음료 2
     ]
 ]
 */
