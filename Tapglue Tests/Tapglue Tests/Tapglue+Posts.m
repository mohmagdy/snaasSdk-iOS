//
//  Tapglue+Posts.h
//  Tapglue iOS SDK
//
//  Created by Martin Stemmle on 08.12.15.
//  Copyright (c) 2015 Tapglue (https://www.tapglue.com/). All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "Tapglue+Posts.h"
#import "Tapglue+Private.h"
#import "TGPostsManager.h"

@implementation Tapglue (Posts)

+ (TGPostsManager*)postsManager {
    return [self sharedInstance].postsManager;
}

#pragma mark - Posts -

#pragma mark CRUD

+ (void)createPostWithText:(NSString*)attachmentText
                     named:(NSString*)attachmentName
       withCompletionBlock:(TGSucessCompletionBlock)completionBlock {

    TGPost *post = [[TGPost alloc] init];
    [post addAttachment:[TGAttachment attachmentWithText:attachmentText andName:attachmentName]];
    [self createPost:post withCompletionBlock:completionBlock];
}

+ (void)createPost:(TGPost*)post withCompletionBlock:(TGSucessCompletionBlock)completionBlock {
    [[self postsManager] createPost:post withCompletionBlock:completionBlock];
}

+ (void)updatePost:(TGPost*)post withCompletionBlock:(TGSucessCompletionBlock)completionBlock {
    [[self postsManager] updatePost:post withCompletionBlock:completionBlock];
}

+ (void)deletePostWithId:(NSString*)objectId withCompletionBlock:(TGSucessCompletionBlock)completionBlock {
    [[self postsManager] deletePostWithId:objectId withCompletionBlock:completionBlock];
}

+ (void)retrievePostWithId:(NSString*)objectId withCompletionBlock:(TGGetPostCompletionBlock)completionBlock {
    [[self postsManager] retrievePostWithId:objectId withCompletionBlock:completionBlock];
}

#pragma mark Lists

+ (void)retrieveAllPostsWithCompletionBlock:(TGGetPostListCompletionBlock)completionBlock {
    [[self postsManager] retrieveAllPostsWithCompletionBlock:completionBlock];
}

+ (void)retrievePostsFeedForCurrentUserWithCompletionBlock:(TGGetPostListCompletionBlock)completionBlock {
    [[self postsManager] retrievePostsFeedForCurrentUserWithCompletionBlock:completionBlock];
}

+ (void)retrievePostsForCurrentUserWithCompletionBlock:(TGGetPostListCompletionBlock)completionBlock {
    [[self postsManager] retrievePostsForCurrentUserWithCompletionBlock:completionBlock];
}

+ (void)retrievePostsForUser:(TGUser*)user withCompletionBlock:(TGGetPostListCompletionBlock)completionBlock {
    [self retrievePostsForUserWithId:user.userId withCompletionBlock:completionBlock];
}

+ (void)retrievePostsForUserWithId:(NSString*)userId withCompletionBlock:(TGGetPostListCompletionBlock)completionBlock {
    [[self postsManager] retrievePostsForUserWithId:userId withCompletionBlock:completionBlock];
}


@end
