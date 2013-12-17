//====================================================================================================
// Author: Peter Chen
// Created: 12/16/13
// Copyright 2013 Peter Chen
//====================================================================================================

#import "PCSGroupedTableCollectionHeader.h"

#define kLabelLeftMargin 15

@interface PCSGroupedTableCollectionHeader()

@property (nonatomic, strong) UILabel *label;

@end

@implementation PCSGroupedTableCollectionHeader

- (id)initWithFrame:(CGRect)frame {
   if ((self = [super initWithFrame:frame])) {
      self.label = [[UILabel alloc] initWithFrame:CGRectInset(self.bounds, kLabelLeftMargin, 0)];
      self.label.font = [UIFont systemFontOfSize:14];
      self.label.textColor = [UIColor colorWithWhite:0.45 alpha:1];
      [self addSubview:self.label];
   }
   return self;
}

- (void)prepareForReuse {
   [super prepareForReuse];
}

- (NSString *)text {
   return self.label.text;
}

- (void)setText:(NSString *)text {
   self.label.text = [text uppercaseString];
}

@end
