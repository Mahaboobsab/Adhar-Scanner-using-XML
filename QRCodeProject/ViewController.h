//
//  ViewController.h
//  QRCodeProject
//
//  Created by Mahaboobsab Nadaf on 23/12/16.
//  Copyright © 2016 Mahaboobsab Nadaf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController@property (strong, nonatomic) NSMutableArray *arrayData;

- (IBAction)generateQRCode:(id)sender;

- (IBAction)scanQRCode:(id)sender;
@end

