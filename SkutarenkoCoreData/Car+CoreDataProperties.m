//
//  Car+CoreDataProperties.m
//  SkutarenkoCoreData
//
//  Created by Nataliya Murauyova on 7/16/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//
//

#import "Car+CoreDataProperties.h"

@implementation Car (CoreDataProperties)

+ (NSFetchRequest<Car *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Car"];
}

@dynamic model;
@dynamic owner;

@end
