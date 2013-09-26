//
//  AssertionCategories.m
//  evilapples
//
//  Created by Danny Ricciotti on 1/8/13.
//  Copyright (c) 2013 Danny Ricciotti. All rights reserved.
//

#import "CollectionExtensions.h"

@implementation NSDictionary (NSDictionaryExtensions)

- (id)objectForKey:(id)aKey ofClass:(NSString *)aClassName;
{
    return [self objectForKey:aKey ofClass:aClassName mustExist:YES];
}

- (id)objectForKey:(id)aKey ofClass:(NSString *)aClassName mustExist:(BOOL)mustExist {
    
    id object = [(NSDictionary *)self objectForKey:aKey];
    
#ifdef DEBUG
    
    // if object exists, check the class
    // if it doesn't, check whether mustExist is YES
    // if it isn't, return the object (nil)
    
    if (object) {
        // cannot include this string directly in NSCAssert; but very helpful for debugging
        NSString *errorString = [NSString stringWithFormat:@"Invalid kind of class; expected: %@, actual: %@",
                                 aClassName,
                                 NSStringFromClass([object class])];
        
        NSCAssert([object isKindOfClass:NSClassFromString(aClassName)] == YES,errorString);
    } else if (mustExist) {
        
        NSString *errorString = @"Object does not exist!";
        NSCAssert(NO,errorString);
        
    }
#endif
    
    return object;
    
}

@end

@implementation NSMutableDictionary (NSMutableDictionaryExtensions)

- (void)setObject:(id)object forKey:(id<NSCopying>)aKey ignoreNil:(BOOL)ignoreNil;
{
	if(object || !ignoreNil)
	{
		[self setObject:object forKey:aKey];
	}
}


@end

@implementation NSArray (NSArrayExctensions)

- (id)objectAtIndex:(NSUInteger)index ofClass:(NSString *)aClassName;
{
    id object = [self objectAtIndex:index];
    
#ifdef DEBUG
    NSCAssert([object isKindOfClass:NSClassFromString(aClassName)] == YES, @"Invalid kind of class.");
#endif
    
    return object;
}

@end


@implementation NSMutableArray (NSMutableArrayExtensions)

- (void)addObject:(id)object ignoreNil:(BOOL)ignoreNil;
{
	if(object || !ignoreNil)
	{
		[self addObject:object];
	}
}

@end
