//
//  Object+CoreDataProperties.m
//  SkutarenkoCoreData
//
//  Created by Nataliya Murauyova on 7/16/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//
//

#import "Object+CoreDataProperties.h"

@implementation Object (CoreDataProperties)

+ (NSFetchRequest<Object *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Object"];
}


@end
