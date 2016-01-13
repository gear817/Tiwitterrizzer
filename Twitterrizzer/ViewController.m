//
//  ViewController.m
//  Twitterrizzer
//
//  Created by Danny Vasquez on 1/13/16.
//  Copyright © 2016 Danny Vasquez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

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

- (IBAction)onTwitterrizeButtonPressed:(UIButton *)sender {
    NSString *textFieldString = self.textView.text;
    NSMutableString *result = [[NSMutableString alloc] initWithString:textFieldString];
    NSArray *vowels = @[
}

@end
