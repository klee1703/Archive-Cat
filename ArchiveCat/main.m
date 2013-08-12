//
//  main.m
//  ArchiveCat
//
//  Created by Keith Lee on 3/8/13.
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

#import <Foundation/Foundation.h>
#import "Archiver.h"
#import "Subfamily.h"

int main(int argc, const char * argv[])
{
  @autoreleasepool
  {
    // Create an Archiver to encode/decode an object graph
    Archiver *archiver = [[Archiver alloc] init];
    
    // Create an object graph and archive it to a file
    id animal = [[Subfamily alloc] initWithSpecies:@"Lion"
                                             genus:@"Panther"
                                            family:@"Felid"
                                             order:@"Carnivore"];
    NSLog(@"\n%@", [animal description]);
    NSString *file = @"data.archive";
    
    // Display results
    if ([archiver encodeArchive:animal toFile:file])
    {
      NSLog(@"You encoded an archive to file %@",
            [[archiver path] stringByAppendingString:file]);
    }
    
    // Decode object graph from archive and log its description
    id data = [archiver decodeArchiveFromFile:file];
    if ([archiver decodeArchiveFromFile:file])
    {
      NSLog(@"You decoded an archive from file %@\n%@",
            [[archiver path] stringByAppendingString:file], [data description]);
    }
    
  }
  return 0;
}

