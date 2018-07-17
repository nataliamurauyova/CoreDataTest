//
//  Student+CoreDataProperties.h
//  SkutarenkoCoreData
//
//  Created by Nataliya Murauyova on 7/17/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//
//

#import "Student+CoreDataClass.h"
#import "Car+CoreDataClass.h"
#import "University+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dateOfBirth;
@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nonatomic) double score;
@property (nullable, nonatomic, retain) Car *car;
@property (nullable, nonatomic, retain) University *university;
@property (nullable, nonatomic, retain) NSSet<Course *> *courses;

@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(Course *)value;
- (void)removeCoursesObject:(Course *)value;
- (void)addCourses:(NSSet<Course *> *)values;
- (void)removeCourses:(NSSet<Course *> *)values;

@end

NS_ASSUME_NONNULL_END
