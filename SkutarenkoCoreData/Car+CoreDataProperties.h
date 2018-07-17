//
//  Car+CoreDataProperties.h
//  SkutarenkoCoreData
//
//  Created by Nataliya Murauyova on 7/17/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//
//

#import "Car+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Car (CoreDataProperties)

+ (NSFetchRequest<Car *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *model;
@property (nullable, nonatomic, retain) Student *owner;

@end

NS_ASSUME_NONNULL_END
