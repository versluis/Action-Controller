//
//  ViewController.m
//  UIActionController
//
//  Created by Jay Versluis on 28/09/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIAlertController *alertWithText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert {
    
    // create an alert controller with the appearance of an alert view
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Attention" message:@"This looks just like the old UIAlertView, doesn't it?" preferredStyle:UIAlertControllerStyleAlert];
    
    // create the actions handled by each button
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Defo!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"User said DEFO!");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Never!" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"User said NEVER!");
    }];
    
    // add actions to our alert
    [alert addAction:action1];
    [alert addAction:action2];
    
    // display the alert controller
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)showActionSheet:(id)sender {
    
    // create an alert controller with action sheet appearance
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Blimey, Guvna!" message:@"This looks just like the old UIActionSheet, doesn't it?" preferredStyle:UIAlertControllerStyleActionSheet];
    
    // create the actions handled by each button
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Defo!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"User said DEFO!");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Never!" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"User said NEVER!");
    }];
    
    // add actions to our sheet
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    
    // bring up the action sheet
    [self presentViewController:actionSheet animated:YES completion:nil];
}

- (IBAction)showAlertWithTextInput:(id)sender {
    
    // display the alert controller
    [self presentViewController:self.alertWithText animated:YES completion:nil];
}

- (UIAlertController *)alertWithText {
    
    if (!_alertWithText) {
        
        // create an alert controller
        _alertWithText = [UIAlertController alertControllerWithTitle:@"Tell me something" message:@"Give me your phone number so I can call you thirtyseven times every day." preferredStyle:UIAlertControllerStyleAlert];
        
        // create the actions handled by each button
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"User chose OK");
            NSLog(@"User Input was %@", [self accessAlertTextField]);
        }];
        
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"User chose CANCEL (and we don't want to know what the input was)");
        }];
        
        // add the actions to our alert
        [_alertWithText addAction:action1];
        [_alertWithText addAction:action2];
        
        // add a text field
        [_alertWithText addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            
            // pre-populate the text field and properties
            textField.text = @"(646) 401-0937";
            textField.keyboardType = UIKeyboardTypePhonePad;
            textField.keyboardAppearance = UIKeyboardAppearanceDark;
        }];
    }
    return _alertWithText;
}

- (NSString *)accessAlertTextField {
    
    return [self.alertWithText.textFields lastObject].text;
}

@end
