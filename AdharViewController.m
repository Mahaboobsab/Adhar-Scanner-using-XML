//
//  AdharViewController.m
//  QRCodeProject
//
//  Created by Mahaboobsab Nadaf on 30/03/17.
//  Copyright © 2017 Mahaboobsab Nadaf. All rights reserved.
//

#import "AdharViewController.h"

@interface AdharViewController ()

@end

@implementation AdharViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nameTextField.text = [self.reciedDetails valueForKey:@"name"];
    self.coTextField.text = [self.reciedDetails valueForKey:@"co"];
    self.genderTextField.text = [self.reciedDetails valueForKey:@"gender"];
    self.pinTextField.text = [self.reciedDetails valueForKey:@"pc"];
    self.stateTextField.text = [self.reciedDetails valueForKey:@"state"];
    self.adharTextfield.text = [self.reciedDetails valueForKey:@"uid"];
    self.dobTextField.text = [self.reciedDetails valueForKey:@"yob"];
    self.tqTextField.text = [self.reciedDetails valueForKey:@"subdist"];
    self.distTextField.text = [self.reciedDetails valueForKey:@"dist"];
    self.adressTextfield.text = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",[self.reciedDetails valueForKey:@"po"],[self.reciedDetails valueForKey:@"vtc"],[self.reciedDetails valueForKey:@"subdist"],[self.reciedDetails valueForKey:@"state"],[self.reciedDetails valueForKey:@"pc"]];
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
-(void)recieveAdharDetails:(NSArray *)adharArray{

    self.reciedDetails = adharArray;
    
    NSLog(@"Recied Adhar Arra : %@",self.reciedDetails);
}
@end
