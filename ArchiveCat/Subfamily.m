//
//  Subfamily.m
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

#import "Subfamily.h"

@implementation Subfamily

- (id)initWithSpecies:(NSString *)species
             genus:(NSString *)genus
            family:(NSString *)family
             order:(NSString *)order
{
  if ((self = [super initWithFamily:family order:order]))
  {
    _species = species;
    _genus = genus;
  }
  
  return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
  if ((self = [super initWithCoder:coder]))
  {
    _species = [coder decodeObjectForKey:@"SPECIES_KEY"];
    _genus = [coder decodeObjectForKey:@"GENUS_KEY"];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [super encodeWithCoder:coder];
  [coder encodeObject:self.species forKey:@"SPECIES_KEY"];
  [coder encodeObject:self.genus forKey:@"GENUS_KEY"];
}


- (NSString *) description
{
  return [NSString stringWithFormat:@"Animal - Species:%@ Genus:%@, %@",
          self.species, self.genus, [super description]];
}

@end
