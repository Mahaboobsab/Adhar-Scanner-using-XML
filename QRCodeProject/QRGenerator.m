//
//  QRGenerator.m
//  QRCodeProject
//
//  Created by Mahaboobsab Nadaf on 23/12/16.
//  Copyright © 2016 Mahaboobsab Nadaf. All rights reserved.
//

#import "QRGenerator.h"

@interface QRGenerator ()

@end

@implementation QRGenerator{

    NSInteger selectedIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.qrNamesArray = [[NSArray alloc] initWithObjects:@"CEO",@"COO",@"Manager",@"CTO", nil];;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButton:(id)sender {
}

- (IBAction)generateQrCode:(id)sender {
    
    
    // Get the string
    NSString *stringToEncode = [NSString stringWithFormat:@"%@",[self.qrNamesArray objectAtIndex:selectedIndex]];
    
    // Generate the image
    CIImage *qrCode = [self createQRForString:stringToEncode];
    
    // Convert to an UIImage
    UIImage *qrCodeImg = [self createNonInterpolatedUIImageFromCIImage:qrCode withScale:2*[[UIScreen mainScreen] scale]];
    
    // And push the image on to the screen
    self.qrCodeImageView.image = qrCodeImg;
}

- (IBAction)saveQRCode:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.allowsEditing = NO;
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
    
    [self saveImage:self.qrCodeImageView.image];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;


}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
 
    return  self.qrNamesArray.count;

}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    selectedIndex = row ;
    
    self.qrCodeImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[self.qrNamesArray objectAtIndex:row]]] ;

    return [self.qrNamesArray objectAtIndex:row];
}


- (CIImage *)createQRForString:(NSString *)qrString
{
    // Need to convert the string to a UTF-8 encoded NSData object
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    
    // Create the filter
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // Set the message content and error-correction level
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"H" forKey:@"inputCorrectionLevel"];
    
    // Send the image back
    return qrFilter.outputImage;
}


- (UIImage *)createNonInterpolatedUIImageFromCIImage:(CIImage *)image withScale:(CGFloat)scale
{
    // Render the CIImage into a CGImage
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:image fromRect:image.extent];
    
    // Now we'll rescale using CoreGraphics
    UIGraphicsBeginImageContext(CGSizeMake(image.extent.size.width * scale, image.extent.size.width * scale));
    CGContextRef context = UIGraphicsGetCurrentContext();
    // We don't want to interpolate (since we've got a pixel-correct image)
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    // Get the image out
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // Tidy up
    UIGraphicsEndImageContext();
    CGImageRelease(cgImage);
    return scaledImage;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    [self saveImage:selectedImage];
    self.qrCodeImageView.image = [self loadImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)saveImage: (UIImage*)image
{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    });
    
    
}
- (UIImage*)loadImage
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      @"image.png" ];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    return image;
}
@end
