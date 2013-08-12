//
//  Archiver.m
//  ArchiveCat
//
//  Created by Keith Lee on 3/9/13.
//  Copyright (c) 2013 Keith Lee. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are
//  permitted provided that the following conditions are met:
//
//   1. Redistributions of source code must retain the above copyright notice, this list of
//      conditions and the following disclaimer.
//
//   2. Redistributions in binary form must reproduce the above copyright notice, this list
//      of conditions and the following disclaimer in the documentation and/or other materials
//      provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY Keith Lee ''AS IS'' AND ANY EXPRESS OR IMPLIED
//  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
//  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Keith Lee OR
//  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  The views and conclusions contained in the software and documentation are those of the
//  authors and should not be interpreted as representing official policies, either expressed
//  or implied, of Keith Lee.

#import "Archiver.h"

@implementation Archiver

- (id) init
{
  if ((self = [super init]))
  {
    _path = NSTemporaryDirectory();
  }
  
  return self;  
}

- (BOOL) encodeArchive:(id)objectGraph toFile:(NSString *)file
{
  NSParameterAssert(file != nil);
  NSParameterAssert([objectGraph conformsToProtocol:@protocol(NSCoding)]);
  
  NSString *archivePath = [self.path stringByAppendingPathComponent:file];
  
  // Create an archiver for encoding data
  NSMutableData *mdata = [[NSMutableData alloc] init];
  NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]
                               initForWritingWithMutableData:mdata];
  
  // Encode the data, keyed with a simple string
  [archiver encodeObject:objectGraph forKey:@"FELINE_KEY"];
  [archiver finishEncoding];
  
  // Write the encoded data to a file, returning status of the write
  BOOL result = [mdata writeToFile:archivePath atomically:YES];
  return result;
}

- (id) decodeArchiveFromFile:(NSString *) file
{
  // Get path to file with archive
  NSString *archivePath = [self.path stringByAppendingPathComponent:file];
  
  // Create an unarchiver for decoding data
  NSData *data = [[NSMutableData alloc] initWithContentsOfFile:archivePath];
  NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]
                                   initForReadingWithData:data];
  
  // Decode the data, keyed with simple string
  id result = [unarchiver decodeObjectForKey:@"FELINE_KEY"];
  [unarchiver finishDecoding];
  
  // Return the decoded data
  return result;
}

@end
