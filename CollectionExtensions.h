//
//  AssertionCategories.h
//  evilapples
//
//  Created by Danny Ricciotti on 1/8/13.
//  Copyright (c) 2013 Danny Ricciotti. All rights reserved.
//

@interface NSDictionary (NSDictionaryExtensions)

- (id)objectForKey:(id)aKey ofClass:(NSString *)aClassName;
- (id)objectForKey:(id)aKey ofClass:(NSString *)aClassName mustExist:(BOOL)mustExist;

@end

@interface NSMutableDictionary (NSMutableDictionaryExtensions)

- (void)setObject:(id)object forKey:(id<NSCopying>)aKey ignoreNil:(BOOL)ignoreNil;

@end

@interface NSArray (NSArrayExctensions)

- (id)objectAtIndex:(NSUInteger)index ofClass:(NSString *)aClassName;

@end

@interface NSMutableArray (NSMutableArrayExtensions)

- (void)addObject:(id)object ignoreNil:(BOOL)ignoreNil;

@end