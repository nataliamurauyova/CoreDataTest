
//
//  AppDelegate.m
//  SkutarenkoCoreData
//
//  Created by Nataliya Murauyova on 7/16/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//

#import "AppDelegate.h"
#import "Student+CoreDataClass.h"
#import "Student+CoreDataProperties.h"
#import "Car+CoreDataClass.h"
#import "University+CoreDataClass.h"




@interface AppDelegate ()

@end



static NSString *firstNames[] = {
    @"John",@"James",@"Ivan",@"Mark",@"Marta",@"Will",@"Leo",
    @"Taylor",@"Ben",@"Pan"
};
static NSString *lastNames[] = {
    @"Sim",@"Oldham",@"Bator",@"Burke",@"Rook",@"Lenz",@"Prill",
    @"Pitt",@"Shimms",@"Pan"
};
static NSString *carModelNames[] = {
    @"Audi",@"BMW",@"Skoda",@"Toyota",@"Lada"
};

@implementation AppDelegate


-(Student*)addRandomStudent{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
    student.score = arc4random_uniform(201)/ 100.f + 2.f;
    student.dateOfBirth = [NSDate dateWithTimeIntervalSince1970:60*60*24*365*arc4random_uniform(31)];
    student.firstName = firstNames[arc4random_uniform(10)];
    student.lastName = lastNames[arc4random_uniform(10)];
    return student;
}

-(Car*) addRandomCar {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    Car *car = [NSEntityDescription insertNewObjectForEntityForName:@"Car" inManagedObjectContext:context];
    car.model = carModelNames[arc4random_uniform(5)];
    return car;
}

-(University*) addUniversity{
    University* univer = [NSEntityDescription insertNewObjectForEntityForName:@"University" inManagedObjectContext:self.persistentContainer.viewContext];
    univer.name = @"BSUIR";
    return univer;
}
-(Course*) addCourseWithName: (NSString*) name{
    Course* course = [NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:self.persistentContainer.viewContext];
    course.name = name;
    return course;
}

-(NSArray*)allObjects{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Object" inManagedObjectContext:context];
    
    [request setEntity:description];
    
    NSError *requesterror = nil;
    NSArray *resultArray = [context executeFetchRequest:request error:&requesterror];
    if(requesterror){
        NSLog(@"%@",[requesterror localizedDescription]);
    }

    return resultArray;
}

-(void)printArray: (NSArray*) array{
    
    for (id object in array) {
        
        if([object isKindOfClass:[Car class]]){
            Car* car = (Car*)object;
            NSLog(@"CAR: %@, OWNER: %@ %@",car.model,car.owner.firstName,car.owner.lastName);
        } else if ([object isKindOfClass:[Student class]]){
            Student *student = (Student*)object;
            NSLog(@"STUDENT: %@ %@, SCORE: %1.2f, COURSES: %lu",student.firstName,student.lastName,student.score,[student.courses count]);
        } else if ([object isKindOfClass:[University class]]){
            University *university = (University*)object;
            NSLog(@"UNIVERSITY: %@ STUDENTS: %lu",university.name,[university.students count]);
        }
        else if ([object isKindOfClass:[Course class]]){
            Course *course = (Course*)object;
            NSLog(@"COURSE: %@ STUDENTS: %lu",course.name,[course.students count]);
        }
        //NSLog(@"%@",object);
    }
    NSLog(@"Count - %lu",(unsigned long)[array count]);
}
-(void)printAllObjects{
    NSArray *allObjects = [self allObjects];
    [self printArray:allObjects];
   
}
-(void)deleteAllObjects{
    NSArray *allObjects = [self allObjects];
    for (id object in allObjects) {
        [self.persistentContainer.viewContext deleteObject:object];
    }
    [self.persistentContainer.viewContext save:nil];
    
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSManagedObjectModel * model = self.persistentContainer.managedObjectModel;
    NSPersistentStoreCoordinator *coordinator = self.persistentContainer.persistentStoreCoordinator;
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    
//    [self deleteAllObjects];
//    NSError *error = nil;
//
//
//    NSArray* courses = @[[self addCourseWithName:@"iOS"],
//                         [self addCourseWithName:@"Android"],
//                         [self addCourseWithName:@"Python"],
//                         [self addCourseWithName:@"Java"],
//                         [self addCourseWithName:@"PHP"]];
//    University* university = [self addUniversity];
//    [university addCourses:[NSSet setWithArray:courses]];
//    for (int i = 0; i<100; i++) {
//        Student* student = [self addRandomStudent];
//
//        if(arc4random_uniform(1000) < 500){
//            Car* car = [self addRandomCar];
//            student.car = car;
//        }
//
//        student.university = university;
//
//        NSInteger number = arc4random_uniform(5)+1;
//        while ([student.courses count]<number) {
//            Course* course = [courses objectAtIndex:arc4random_uniform(5)];
//
//            if(![student.courses containsObject:course]){
//                [student addCoursesObject:course];
//            }
//        }
//    }
//    if(![self.persistentContainer.viewContext save:&error]){
//        NSLog(@"%@",[error localizedDescription]);
//    }
//
//    [self printAllObjects];
    
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSFetchRequest *request = [self.persistentContainer.managedObjectModel fetchRequestTemplateForName:@"FetchStudent"] ;
//    NSEntityDescription *description = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:context];
//
//    [request setEntity:description];
//    [request setFetchBatchSize:20];
//    [request setFetchOffset:10];
//    [request setFetchLimit:35];
//    [request setRelationshipKeyPathsForPrefetching:@[@"courses"]];
    
//    NSSortDescriptor *firstNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
//    NSSortDescriptor *lastNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
//    [request setSortDescriptors:@[firstNameDescriptor,lastNameDescriptor]];
//    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
//    [request setSortDescriptors:@[nameDescriptor]];
    NSArray *validNames = @[@"James",@"Marta"];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:
//                              @"score > %f AND score <= 3.5 && courses.@count >= 3 AND firstName IN %@ ", 3.0,validNames];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"@sum.students.score > %f",96.0];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SUBQUERY(students, $student, $student.car. model == %@).@count >= %d",@"Audi",6];
//    [request setPredicate:predicate];

    NSError *requesterror = nil;
    NSArray *resultArray = [context executeFetchRequest:request error:&requesterror];
    
    //resultArray = [resultArray subarrayWithRange:NSMakeRange(0, 50)];
    
    [self printArray:resultArray];
    
        return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"SkutarenkoCoreData"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
