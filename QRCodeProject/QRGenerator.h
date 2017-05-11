//
//  QRGenerator.h
//  QRCodeProject
//
//  Created by Mahaboobsab Nadaf on 23/12/16.
//  Copyright © 2016 Mahaboobsab Nadaf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRGenerator : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImageView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbarForButtonss;

- (IBAction)cancelButton:(id)sender;
- (IBAction)generateQrCode:(id)sender;

- (IBAction)saveQRCode:(id)sender;

//Data Source For PickerView

@property(strong,nonatomic)NSArray *qrNamesArray;
@end
