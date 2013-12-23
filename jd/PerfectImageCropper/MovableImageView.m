//
//  MovableImageView.m
//  PicDecor
//
//  Created by Leo Gau on 12/10/12.
//  Copyright (c) 2012 Leo Gau. All rights reserved.
//

#import "MovableImageView.h"

@implementation MovableImageView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    float deltaX = [[touches anyObject] locationInView:self].x - [[touches anyObject] previousLocationInView:self].x;
    float deltaY = [[touches anyObject] locationInView:self].y - [[touches anyObject] previousLocationInView:self].y;
    
    self.transform = CGAffineTransformTranslate(self.transform, deltaX, deltaY);
}

@end
