//
//  QRCodeReader.h
//  QRCodeProject
//
//  Created by Mahaboobsab Nadaf on 23/12/16.
//  Copyright © 2016 Mahaboobsab Nadaf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AdharViewController.h"
@interface QRCodeReader : UIViewController<AVCaptureMetadataOutputObjectsDelegate,NSXMLParserDelegate>
{
    NSMutableDictionary *dict;
    NSMutableString *curElem;
    
}
@property (strong, nonatomic) NSMutableArray *arrayData;
@property (weak, nonatomic) IBOutlet UIView *viewPreview;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
- (IBAction)startStopReading:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *bbitemStart;
@end
