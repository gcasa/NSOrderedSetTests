//
//  main.m
//  NSOrderedSetTests
//
//  Created by Gregory John Casamento on 6/8/19.
//  Copyright © 2019 Gregory John Casamento. All rights reserved.
//

#import <Foundation/Foundation.h>

#define START_SET(X) NSLog(X)
#define END_SET(X) NSLog(X)

void passTest(BOOL flag,
              NSString *msg)
{
    if(flag == YES)
    {
        NSLog(@"PASS: %@",msg);
    }
    else
    {
        NSLog(@"FAIL: %@",msg);
    }
}

void runTests()
{
    START_SET(@"NSOrderedSet base");
    
    NSOrderedSet *testObj, *testObj2;
    NSMutableOrderedSet *mutableTest1, *mutableTest2;
    NSMutableArray *testObjs = [NSMutableArray new];
    
    testObj = [NSOrderedSet new];
    [testObjs addObject: testObj];
    passTest(testObj != nil && [testObj count] == 0,
         @"can create an empty ordered set");
    
    testObj = [NSOrderedSet orderedSetWithObject: @"Hello"];
    [testObjs addObject: testObj];
    passTest(testObj != nil && [testObj count] == 1,
         @"can create an ordered set with one element");
    
    id objs[] = {@"Hello", @"Hello1"};
    testObj = [NSOrderedSet orderedSetWithObjects: objs count: 2];
    [testObjs addObject: testObj];
    passTest(testObj != nil && [testObj count] == 2,
             @"can create an ordered set with multi element");
    
    id objs1[] = {@"Hello", @"Hello"};
    testObj = [NSOrderedSet orderedSetWithObjects: objs1 count: 2];
    [testObjs addObject: testObj];
    passTest(testObj != nil && [testObj count] == 1,
             @"cannot create an ordered set with multiple like elements");

    id objs2[] = {@"Hello"};
    testObj = [NSOrderedSet orderedSetWithObjects: objs2 count: 2];
    [testObjs addObject: testObj];
    passTest(testObj != nil && [testObj count] == 1,
             @"Does not throw exception when count != to number of elements");
    
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject: @"Hello"];
    [arr addObject: @"World"];
    testObj = [NSOrderedSet orderedSetWithArray: arr];
    [testObjs addObject: testObj];
    passTest(testObj != nil && [testObj count] == 2,
             @"Is able to initialize with array");
    
    id objs3[] = {@"Hello"};
    id objc4[] = {@"World"};
    testObj  = [NSOrderedSet orderedSetWithObjects: objs3 count: 1];
    [testObjs addObject: testObj];
    testObj2 = [NSOrderedSet orderedSetWithObjects: objc4 count: 1];
    [testObjs addObject: testObj2];
    BOOL result = [testObj intersectsOrderedSet: testObj2];
    passTest(result == NO,
             @"Sets do not intersect!");

    id objs5[] = {@"Hello"};
    id objc6[] = {@"Hello"};
    testObj  = [NSOrderedSet orderedSetWithObjects: objs5 count: 1];
    [testObjs addObject: testObj];
    testObj2 = [NSOrderedSet orderedSetWithObjects: objc6 count: 1];
    [testObjs addObject: testObj2];
    BOOL result1 = [testObj intersectsOrderedSet: testObj2];
    passTest(result1 == YES,
             @"Sets do intersect!");
    
    id o1 = @"Hello";
    id o2 = @"World";
    mutableTest1 = [NSMutableOrderedSet orderedSet];
    [mutableTest1 addObject:o1];
    [testObjs addObject: mutableTest1];
    mutableTest2 = [NSMutableOrderedSet orderedSet];
    [mutableTest2 addObject:o2];
    [testObjs addObject: mutableTest2];
    [mutableTest1 unionOrderedSet:mutableTest2];
    passTest(mutableTest1 != nil && mutableTest2 != nil && [mutableTest1 count] == 2,
             @"mutableSets union properly");
    
    //test_NSObject(@"NSOrderedSet", testObjs);
    //test_NSCoding(testObjs);
    //test_NSCopying(@"NSOrderedSet", @"NSMutableOrderedSet", testObjs, YES, NO);
    //test_NSMutableCopying(@"NSOrderedSet", @"NSMutableOrderedSet", testObjs);
    
    END_SET(@"NSOrderedSet base");
    //return 0;
}

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // insert code here...
        runTests();
    }
    return 0;
}
