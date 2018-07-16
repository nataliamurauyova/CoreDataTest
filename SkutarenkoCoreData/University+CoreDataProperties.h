//
//  University+CoreDataProperties.h
//  SkutarenkoCoreData
//
//  Created by Nataliya Murauyova on 7/16/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//
//

#import "University+CoreDataClass.h"
#import "Object+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface University (CoreDataProperties)

+ (NSFetchRequest<University *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Student *> *students;

@end

@interface University (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(Student *)value;
- (void)removeStudentsObject:(Student *)value;
- (void)addStudents:(NSSet<Student *> *)values;
- (void)removeStudents:(NSSet<Student *> *)values;

@end

NS_ASSUME_NONNULL_END
