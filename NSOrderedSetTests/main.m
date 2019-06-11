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
    
    id o3 = @"Hello";
    id o4 = @"World";
    mutableTest1 = [NSMutableOrderedSet orderedSet];
    [mutableTest1 addObject:o3];
    [testObjs addObject: mutableTest1];
    mutableTest2 = [NSMutableOrderedSet orderedSet];
    [mutableTest2 addObject:o4];
    [testObjs addObject: mutableTest2];
    [mutableTest1 intersectOrderedSet:mutableTest2];
    passTest(mutableTest1 != nil && mutableTest2 != nil && [mutableTest1 count] == 0,
             @"mutableSets do not intersect");
    
    id o5 = @"Hello";
    id o6 = @"Hello";
    mutableTest1 = [NSMutableOrderedSet orderedSet];
    [mutableTest1 addObject:o5];
    [testObjs addObject: mutableTest1];
    mutableTest2 = [NSMutableOrderedSet orderedSet];
    [mutableTest2 addObject:o6];
    [testObjs addObject: mutableTest2];
    [mutableTest1 intersectOrderedSet:mutableTest2];
    passTest(mutableTest1 != nil && mutableTest2 != nil && [mutableTest1 count] == 1,
             @"mutableSets do intersect");
    
    id o7 = @"Hello";
    id o8 = @"World";
    mutableTest1 = [NSMutableOrderedSet orderedSet];
    [mutableTest1 addObject:o7];
    [mutableTest2 addObject:o8];
    [testObjs addObject: mutableTest1];
    mutableTest2 = [NSMutableOrderedSet orderedSet];
    [mutableTest2 addObject:o7];
    [testObjs addObject: mutableTest2];
    BOOL isSubset = [mutableTest2 isSubsetOfOrderedSet:mutableTest1];
    passTest(isSubset,
             @"mutableTest2 is subset of mutableTest1");
    
    id o9 = @"Hello";
    id o10 = @"World";
    id o11 = @"Ready";
    mutableTest1 = [NSMutableOrderedSet orderedSet];
    [mutableTest1 addObject:o9];
    [testObjs addObject: mutableTest1];
    mutableTest2 = [NSMutableOrderedSet orderedSet];
    [mutableTest2 addObject:o10];
    [mutableTest2 addObject:o9];
    [testObjs addObject: mutableTest2];
    isSubset = [mutableTest2 isSubsetOfOrderedSet:mutableTest1];
    passTest(isSubset == NO,
             @"mutableTest2 is not subset of mutableTest1");
    
    o9 = @"Hello";
    o10 = @"World";
    o11 = @"Ready";
    id o12 = @"ToGo";
    mutableTest1 = [NSMutableOrderedSet orderedSet];
    [mutableTest1 addObject:o9];
    [mutableTest1 addObject:o10];
    [mutableTest1 addObject:o12];
    [mutableTest1 addObject:o11];
    [testObjs addObject: mutableTest1];
    mutableTest2 = [NSMutableOrderedSet orderedSet];
    [mutableTest2 addObject:o9];
    [mutableTest2 addObject:o10];
    [testObjs addObject: mutableTest2];
    isSubset = [mutableTest2 isSubsetOfOrderedSet:mutableTest1];
    passTest(isSubset,
             @"mutableTest2 is subset of mutableTest1");
    
    o9 = @"Hello";
    o10 = @"World";
    o11 = @"Ready";
    o12 = @"ToGo";
    mutableTest1 = [NSMutableOrderedSet orderedSet];
    [mutableTest1 addObject:o9];
    [mutableTest1 addObject:o10];
    [mutableTest1 addObject:o12];
    [mutableTest1 addObject:o11];
    [testObjs addObject: mutableTest1];
    passTest([mutableTest1 isEqual:mutableTest1],
             @"mutableTest1 is equal to itself");
    
    o9 = @"Hello";
    o10 = @"World";
    o11 = @"Ready";
    o12 = @"ToGo";
    NSMutableOrderedSet *mutableTest3 = [NSMutableOrderedSet orderedSet];
    [mutableTest3 addObject:o9];
    [mutableTest3 addObject:o10];
    [mutableTest3 addObject:o12];
    [mutableTest3 addObject:o11];
    [mutableTest3 insertObject:@"Hello" atIndex:2];
    [testObjs addObject: mutableTest3];
    passTest([mutableTest3 isEqual:mutableTest1] == YES,
             @"Insert at index does not replace existing object");
    
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
