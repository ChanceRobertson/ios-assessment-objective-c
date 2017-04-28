//
//  DMNMovie.h
//  MovieSearch
//
//  Created by Chance Robertson on 4/28/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMNMovie : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *overview;
@property (nonatomic, readonly) double rating;
@property (nonatomic, copy, readonly) NSString *posterURLString;

- (instancetype)initWithTitle:(NSString *)title overview:(NSString *)overview rating:(double)rating posterURLString:(NSString *)posterURLString NS_DESIGNATED_INITIALIZER;

@end

@interface DMNMovie (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end
