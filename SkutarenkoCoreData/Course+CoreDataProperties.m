//
//  Course+CoreDataProperties.m
//  SkutarenkoCoreData
//
//  Created by Nataliya Murauyova on 7/17/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//
//

#import "Course+CoreDataProperties.h"

@implementation Course (CoreDataProperties)

+ (NSFetchRequest<Course *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Course"];
}

@dynamic name;
@dynamic university;
@dynamic students;

@end
