//
//  ViewController.m
//  NMHtmlText
//
//  Created by nayan on 22/06/16.
//  Copyright © 2016 nayan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableAttributedString *attributedText;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *description = @"Dear Sailors and Sailing Lovers,\r\n\r\nWe are doing it again! We have an amazing deal for you. https://pp.vk.me/c636120/v636120720/d25e/QN-PKtWyoxc.jpg How about sailing 8 Days / 7 Nights in one of the most beautiful areas of Greece? Sailing experience is not needed. You can come by yourself or bring your friends. You just need to be fun and friendly to join. \r https://media.zigcdn.com/media/model/2016/Feb/hyundai_tucson_420x210.jpg \n\r\nSAILING IN CORFU\r\nThe sailing itinerary allows you to visit the beautiful bays and coves of the Ionian Islands located off the Albanian and +919875634567 Greek northwestern shore. The islands offer one of the most scenic experiences in Greece: woodlands spread over hills, sandy beaches and picturesque fishing villages. http://data.whicdn.com/images/1092719/large.jpg The waters of these islands are calm and inviting offering a peaceful ambience. The typical sailing itinerary focuses on both northern and southern Ionian Islands offering various adventures depending on what you are looking for on your sailing trip.\r\n\r\nOUR ITINERARY:\r\n1) https://pp.vk.me/c629105/v629105154/3203/PUwALprxDR8.jpg BAY OF LAKKA PAXOS\r\n2) ITHACA\r\n3) KEFALONIA\r http://c5.staticflickr.com/6/5186/5765875732_da79a39fc3_b.jpg \n4) LEFKAS\r\n5) PARGA\r\n6) CORFU\r\n\r\nFinishing your sailing holiday in Corfu, you will have plenty of time to enjoy an extravagant dinner at one of the restaurants near the marina before preparing to fly home the following day.\r\n\r\nWHAT'S INCLUDED?\r http://3.bp.blogspot.com/-EzpvJF2Xhi0/TyGIcfQ4_6I/AAAAAAAAEUU/ZxKhh6S7NyM/s1600/cars-girls-1.jpg \n7 http://www.andreybuligin.com/eng/blog/entertainment-blog/images/text/200x_010.jpg day yacht rental\r\nDinghy and Outboard engine with gasoline\r\nFully insured Yachts\r\nGas for the kitchen\r\nSafety equipment\r\nSheets, blankets & towels\r\nGPS & nautical charts\r\nFinal cleaning\r\nStereo with speakers\r\nTourist taxes\r\nTour planing and administration\r\nA fully featured yacht with everything https://s-media-cache-ak0.pinimg.com/736x/7d/b4/31/7db431ca10f3a9ca2851a4511375023c.jpg you need for amazing sailing holidays\r\nA professional Skipper that will sail you to remote islands and amazing villages\r\nSun, sail, friendships, and unforgettable memories\r\n\r\n 1) https://pp.vk.me/c604329/v604329337/17487/HaK4o9WM7sU.jpg 2) https://pp.vk.me/c633227/v633227843/36904/yLe5rIxPaq0.jpg 3) https://pp.vk.me/c633227/v633227843/3690d/H0RFVtz9HMs.jpg 4) https://pp.vk.me/c633227/v633227843/36916/X9moKsCAlfE.jpg WHAT'S EXCLUDED?\r\nFood, Gas, Marina fees will be shared among the crew. You https://www.instagram.com/kendalljenner can estimate this to be max EUR 80 for the week.\r\n https://pp.vk.me/c636120/v636120720/d22c/DLucLieFtnM.jpg \r\nWHERE CAN YOU BOOK?\r\nYou can book on our website at\r\n https://www.sailingnations.com/yacht/lagoon-400-greece-ionian/ \r\n\r\nDISCOUNT CODE\r\nPlease enter the discount code \"lastminute\" to get a EUR 200 discount on the published price.http://cdn3.pcadvisor.co.uk/cmsdata/features/3420161/Android_800_thumb800.jpg \nThe bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked.\n https://pp.vk.me/c633227/v633227843/368eb/otup0-45wqw.jpg ";
//    [_TestText layoutIfNeeded];
//    _TestText.attributedText = [self convertMagicDescription:description];
    [_CustomText layoutIfNeeded];
    NSLog(@"%f", self.CustomText.frame.size.height);
    [_CustomText setTextWithImage:description];
    NSLog(@"%f", self.CustomText.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Utils

//- (NSAttributedString*)convertMagicDescription:(NSString *) description{
//    NSArray *URLs = [self ExtractUrlFromText:description];
//    NSArray *Tokens = [description componentsSeparatedByString:@" "];
////    NSMutableAttributedString *attributedText = [NSMutableAttributedString new];
//    attributedText = [NSMutableAttributedString new];
//    for (NSString *part in Tokens) {
//        BOOL isURL = NO;
//        BOOL isImagURL = NO;
//        NSString *URL_string;
//        for (NSString *url in URLs) {
//            if ([part isEqualToString:url]) {
//                if ([part hasSuffix:@".jpg"] || [part hasSuffix:@".png"]){
//                    isImagURL = YES;
//                }else{
//                    isURL = YES;
//                }
//                URL_string = url;
//            }
//        }
//        if (isImagURL) {
//            [attributedText appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
//            NSTextAttachment *textAttachment = [NSTextAttachment new];
//            [self LoadImageFromURL:textAttachment URL:URL_string];
//            [attributedText appendAttributedString:[NSAttributedString attributedStringWithAttachment:textAttachment]];
//            [attributedText appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
//        }else if(isURL){
//            [attributedText appendAttributedString:[self attributedLinkWithText:URL_string URLString:URL_string]];
//        }else{
//            [attributedText appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ ", part]]];
//        }
//    }
//    return attributedText;
//}
//
//- (NSAttributedString*)attributedLinkWithText:(NSString*)text URLString:(NSString*)URLString
//{
//    NSURL *URL = [NSURL URLWithString:URLString];
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSLinkAttributeName : URL}];
//    return attributedString;
//}
//
//- (NSArray *)ExtractUrlFromText:(NSString *) text{
//    NSError *error = nil;
////    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"https?://([-\\w\\.]+)+(:\\d+)?(/([\\w/_\\.]*(\\?\\S+)?)?)?" options:NSRegularExpressionCaseInsensitive error:&error];
//    
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"https?://([-\\w.]+)+(:\\d+)?(/([\\w/_.]*(\\S+)?)?)?" options:NSRegularExpressionCaseInsensitive error:&error];
//    
//    NSArray *arrayOfAllMatches = [regex matchesInString:text options:0 range:NSMakeRange(0, [text length])];
//    
//    NSMutableArray *arrayOfURLs = [[NSMutableArray alloc] init];
//    
//    for (NSTextCheckingResult *match in arrayOfAllMatches) {
//        NSString* substringForMatch = [text substringWithRange:match.range];
//        [arrayOfURLs addObject:substringForMatch];
//    }
//    
//    // return non-mutable version of the array
//    return [NSArray arrayWithArray:arrayOfURLs];
//}
//
//-(void) LoadImageFromURL:(NSTextAttachment *) attachment URL:(NSString *) url{
//    NSLog(@"===: %@", url);
////    attachment.image = [self imageWithImage:[UIImage imageNamed:@"g1.jpg"] scaledToWidth:_TestText.frame.size.width];
//    UIImageView *localiview = [[UIImageView alloc] initWithFrame:_tempImage.frame];
//    _tempImage.hidden = YES ;
//    [_tempImage addSubview:localiview];
//    [localiview setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
//       attachment.image = [self imageWithImage:image scaledToWidth:_TestText.frame.size.width];
//        _TestText.attributedText = (NSAttributedString*)attributedText;
//    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
//        NSLog(@"%@", error.localizedDescription);
//    }];
//}
//
//-(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width
//{
//    float oldWidth = sourceImage.size.width;
//    float scaleFactor = i_width / oldWidth;
//    
//    float newHeight = sourceImage.size.height * scaleFactor;
//    float newWidth = oldWidth * scaleFactor;
//    
//    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
//    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}


//5) https://pp.vk.me/c633227/v633227843/368eb/otup0-45wqw.jpg 6) https://pp.vk.me/c629214/v629214068/15c1e/HYMKw5UiDR8.jpg 7) https://pp.vk.me/c633227/v633227843/368c0/vGmjsR3z3hg.jpg 8) https://pp.vk.me/c629522/v629522541/1af24/_mdutNiXHKE.jpg 9) https://pp.vk.me/c633730/v633730886/37898/w5re4GcnA2k.jpg 10) https://pp.vk.me/c626116/v626116740/129f8/-PK0QydSF3Y.jpg 11) https://pp.vk.me/c631923/v631923154/40753/aMuMlOW48A0.jpg 12) https://pp.vk.me/c615826/v615826964/16444/KTGJx-JGrtA.jpg 

@end
