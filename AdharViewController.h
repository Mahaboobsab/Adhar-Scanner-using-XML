//
//  AdharViewController.h
//  QRCodeProject
//
//  Created by Mahaboobsab Nadaf on 30/03/17.
//  Copyright © 2017 Mahaboobsab Nadaf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdharViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *coTextField;
@property (strong, nonatomic) IBOutlet UITextField *genderTextField;
@property (strong, nonatomic) IBOutlet UITextField *dobTextField;
@property (strong, nonatomic) IBOutlet UITextField *tqTextField;
@property (strong, nonatomic) IBOutlet UITextField *distTextField;
@property (strong, nonatomic) IBOutlet UITextField *adharTextfield;
@property (strong, nonatomic) IBOutlet UITextField *adressTextfield;

@property (strong, nonatomic) IBOutlet UITextField *pinTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;

-(void)recieveAdharDetails: (NSArray*)adharArray;
@property(strong,nonatomic)NSArray *reciedDetails;
@end
