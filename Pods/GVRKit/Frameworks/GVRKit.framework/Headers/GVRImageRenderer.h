/**
 * Copyright 2017 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "GVRTextureRenderer.h"

/** Defines a delegate that is called with result of loading a texture in |GVRImageRenderer|. */
@protocol GVRTextureLoadDelegate<NSObject>
@optional

- (void)textureRenderer:(GVRTextureRenderer *)textureRenderer
         didLoadTexture:(GLKTextureInfo *)textureInfo;

- (void)textureRenderer:(GVRTextureRenderer *)textureRenderer
    failedToLoadTextureWithError:(NSError *)error;

@end

/** Defines a texture renderer for images. */
@interface GVRImageRenderer : GVRTextureRenderer

@property(nonatomic, weak) id<GVRTextureLoadDelegate> loadDelegate;

/** Initialize texture renderer from given image. */
- (instancetype)initWithImage:(UIImage *)image;

/** Initialize texture renderer from an image from the given path. */
- (instancetype)initWithContentsOfFile:(NSString *)path;

/** Initialize texture renderer from an image loaded from the given URL. */
- (instancetype)initWithContentsOfURL:(NSURL *)url;

@end
