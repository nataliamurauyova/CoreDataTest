//
//  University+CoreDataProperties.m
//  SkutarenkoCoreData
//
//  Created by Nataliya Murauyova on 7/17/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//
//

#import "University+CoreDataProperties.h"

@implementation University (CoreDataProperties)

+ (NSFetchRequest<University *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"University"];
}

@dynamic name;
@dynamic students;
@dynamic courses;

@end
