//
//  DMNMovieController.h
//  MovieSearch
//
//  Created by Chance Robertson on 4/28/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DMNMovie;

@interface DMNMovieController : NSObject

+ (void)fetchMoviesWithQuery:(NSString *)query completion:(void(^)(NSArray<DMNMovie *> *movies))completion;
+ (void)fetchMovieImageWithPath:(NSString *)path completion:(void (^)(UIImage *))completion;

@end
