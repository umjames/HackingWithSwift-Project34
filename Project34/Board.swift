//
//  Board.swift
//  Project34
//
//  Created by Michael James on 3/13/16.
//  Copyright © 2016 Michael James. All rights reserved.
//

import UIKit

enum ChipColor: Int {
    case None = 0
    case Red
    case Black
}

class Board: NSObject {
    static var width = 7
    static var height = 6
    
    var slots = [ChipColor]()
    
    override init() {
        for _ in 0 ..< Board.width * Board.height {
            slots.append(.None)
        }
        
        super.init()
    }
    
    func chipInColumn(column: Int, row: Int) -> ChipColor {
        return slots[row + column * Board.height]
    }
    
    func setChip(chip: ChipColor, inColumn column: NSInteger, row: NSInteger) {
        slots[row + column * Board.height] = chip
    }
    
    func nextEmptySlotInColumn(column: Int) -> Int? {
        for row in 0 ..< Board.height {
            if chipInColumn(column, row: row) == .None {
                return row
            }
        }
        
        return nil
    }
    
    func canMoveInColumn(column: Int) -> Bool {
        return nextEmptySlotInColumn(column) != nil
    }
    
    func addChip(chip: ChipColor, inColumn column: Int) {
        if let row = nextEmptySlotInColumn(column) {
            setChip(chip, inColumn: column, row: row)
        }
    }
}
