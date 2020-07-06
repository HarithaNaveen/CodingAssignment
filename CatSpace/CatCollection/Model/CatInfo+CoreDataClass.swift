//
//  CatInfo+CoreDataClass.swift
//  CatSpace
//
//  Created by 909547 on 03/07/20.
//  Copyright © 2020 909547. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CatInfo)
final public class CatInfo: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "url"
        case height
        case width
    }

    // MARK: - Life cycle methods
    
    required convenience public init(from decoder: Decoder) throws {
        guard
            let context = decoder.userInfo[CodingUserInfoKey.context] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: CoreDataConstants.Entity.catInfo, in: context) else {
                fatalError("Error in decoding")
        }
        self.init(entity: entity, insertInto: context)
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decodeIfPresent(String.self, forKey: .id)
            imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
            height = try container.decodeIfPresent(Double.self, forKey: .height) ?? 0.0
            width = try container.decodeIfPresent(Double.self, forKey: .width) ?? 0.0
        } catch (let error) {
            print("Error in decoding \(error)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(imageUrl, forKey: .imageUrl)
        try container.encode(height, forKey: .height)
        try container.encode(height, forKey: .width)
    }
    
}
