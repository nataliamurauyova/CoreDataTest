//
//  Object+CoreDataProperties.h
//  SkutarenkoCoreData
//
//  Created by Nataliya Murauyova on 7/16/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//
//

#import "Object+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Object (CoreDataProperties)

+ (NSFetchRequest<Object *> *)fetchRequest;


@end

NS_ASSUME_NONNULL_END
