//
//  AssertionCategories.m
//  evilapples
//
//  Created by Danny Ricciotti on 1/8/13.
//  Copyright (c) 2013 Danny Ricciotti. All rights reserved.
//

#import "CollectionExtensions.h"

@implementation NSDictionary (NSDictionaryExtensions)

- (id)objectForKey:(id)aKey ofClass:(Class)class;
{
    return [[self objectForKey:aKey] isKindOfClass:class] ? [self objectForKey:aKey] : nil;
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

- (id)objectAtIndex:(NSUInteger)index ofClass:(Class)class;
{
	return [[self objectAtIndex:index] isKindOfClass:class] ? [self objectAtIndex:index] : nil;
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
