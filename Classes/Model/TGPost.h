//
//  TGPost.h
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

#import "TGModelObject.h"
#import "TGConstants.h"

@class TGUser, TGAttachment;

@interface TGPost : TGModelObject

/*!
 @abstract User who performed the event.
 @discussion The user will be a TGUser object that contains the user who performed the event.
 */
@property (nonatomic, readonly) TGUser *user;

/*!
 @abstract Visibility of the post.
 @discussion The visibility of the posts determines if it should be public, private or only be seen by connections.
 */
@property (nonatomic, assign) TGVisibility visibility;

/*!
 @abstract Tags of a post.
 @discussion Contains an array of strings which describe tags of a post	"tags". E.g. ["fitness","running"]
 */
@property (nonatomic, strong) NSArray *tags;

/*!
 @abstract Contains various attachments of the post.
 */
@property (nonatomic, strong, readonly) NSArray *attachments;

- (void) addAttachment:(TGAttachment*)attachment;

@end
