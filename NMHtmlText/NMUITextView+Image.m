//
//  NMUITextView+Image.m
//  NMHtmlText
//
//  Created by nayan on 23/06/16.
//  Copyright © 2016 nayan. All rights reserved.
//

#import "NMUITextView+Image.h"
#import "AFNetworking/AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface NMUITextView_Image ()
@property (retain, strong) NSMutableAttributedString *attributedstring;
@end


@implementation NMUITextView_Image
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void) setupView{
    [self layoutIfNeeded];
    self.editable = NO;
    self.dataDetectorTypes = UIDataDetectorTypeAll;
    self.scrollEnabled = NO;
}

- (void)setTextWithImage:(NSString *)text{
    [self convertToAttributedString:text];
    self.attributedText = self.attributedstring;
    [self textViewDidChange];
}

- (void)convertToAttributedString:(NSString *) description{
    NSArray *URLs = [self ExtractUrlFromText:description];
    NSArray *Tokens = [description componentsSeparatedByString:@" "];
    self.attributedstring = [NSMutableAttributedString new];
    for (NSString *part in Tokens) {
        BOOL isURL = NO;
        BOOL isImagURL = NO;
        NSString *URL_string;
        for (NSString *url in URLs) {
            if ([part isEqualToString:url]) {
                if ([part hasSuffix:@".jpg"] || [part hasSuffix:@".png"]){
                    isImagURL = YES;
                }else{
                    isURL = YES;
                }
                URL_string = url;
            }
        }
        if (isImagURL) {
            [self.attributedstring appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
            NSTextAttachment *textAttachment = [NSTextAttachment new];
            [self LoadImageFromURL:textAttachment URL:URL_string];
            [self.attributedstring appendAttributedString:[NSAttributedString attributedStringWithAttachment:textAttachment]];
            [self.attributedstring appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
        }else if(isURL){
            [self.attributedstring appendAttributedString:[self attributedLinkWithText:URL_string URLString:URL_string]];
        }else{
            [self.attributedstring appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ ", part]]];
        }
    }
}


- (NSArray *)ExtractUrlFromText:(NSString *) text{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"https?://([-\\w.]+)+(:\\d+)?(/([\\w/_.]*(\\S+)?)?)?" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:text options:0 range:NSMakeRange(0, [text length])];
    NSMutableArray *arrayOfURLs = [[NSMutableArray alloc] init];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        NSString* substringForMatch = [text substringWithRange:match.range];
        [arrayOfURLs addObject:substringForMatch];
    }
    return [NSArray arrayWithArray:arrayOfURLs];
}

- (NSAttributedString*)attributedLinkWithText:(NSString*)text URLString:(NSString*)URLString
{
    NSURL *URL = [NSURL URLWithString:URLString];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSLinkAttributeName : URL}];
    return attributedString;
}

-(void) LoadImageFromURL:(NSTextAttachment *) attachment URL:(NSString *) url{
    UIImageView *localiview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self addSubview:localiview];
    [localiview setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        attachment.image = [self imageWithImage:image scaledToWidth:self.frame.size.width];
        self.attributedText = self.attributedstring;
        [self textViewDidChange];
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

-(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width
{
    float oldWidth = sourceImage.size.width;
    float scaleFactor = i_width / oldWidth;
    
    float newHeight = sourceImage.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;
    //For start pedding
    newWidth = newWidth - 10;
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)setScrollEnabled:(BOOL)scrollEnabled{
    [super setScrollEnabled:scrollEnabled];
}

- (void)textViewDidChange{
//    CGFloat fixedHight = self.frame.size.height;
//    CGSize newSize = [self sizeThatFits:CGSizeMake(fixedHight, CGFLOAT_MAX)];
//    CGRect newFrame = self.frame;
//    newFrame.size = CGSizeMake(newSize.width,fmaxf(newSize.height, fixedHight));
//    self.frame = newFrame;
    [self sizeToFit];
}

@end
