//
//  Library.swift
//  Adivina_app
//
//  Created by Colaborador on 30/10/15.
//  Copyright © 2015 Elisabet. All rights reserved.
//

import Foundation

func generateNum (start: Int, _ end: Int) -> Int {
    return Int(arc4random_uniform(UInt32(end))) + start
}