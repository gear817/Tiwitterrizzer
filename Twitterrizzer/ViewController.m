//
//  ViewController.m
//  Twitterrizzer
//
//  Created by Danny Vasquez on 1/13/16.
//  Copyright © 2016 Danny Vasquez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property NSString* lastTextViewState;
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

    NSMutableString *result = [[NSMutableString alloc] initWithString:self.textView.text];
    
    NSArray *vowels = @[@"a",@"e",@"i",@"o",@"u"];
    
    for (int i = 0; i < vowels.count; i++) {
        
        NSRange wholeString = NSMakeRange(0, result.length);
        
        [result replaceOccurrencesOfString:vowels[i]
                                withString:@""
                                   options:NSCaseInsensitiveSearch
                                     range:wholeString];
        
    }
    
    result = [self addHashtagsToString:result];
    
    self.textView.text = result;
    self.countLabel.text = [NSString stringWithFormat:@"Count: %i",(int)self.textView.text.length];

    
}

-(NSMutableString *)addHashtagsToString:(NSMutableString *)string {
    
    NSMutableArray *words = [[NSMutableArray alloc]initWithArray:[string componentsSeparatedByString:@" "]];
    
    NSMutableString *result = [NSMutableString new];
    
    int i = 0;
    
    for (NSString *word in words) {
        
        if (i % 2 == 0 || i == 0) {
            
            [result appendString:[NSString stringWithFormat:@"#%@ ", word]];
            
        }else {
            [result appendString:[NSString stringWithFormat:@"%@ ", word]];
        }
        
        i++;
    }
    
    
    return result;
}


-(void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length <= 140) {
        self.countLabel.text = [NSString stringWithFormat:@"Count: %i",(int)self.textView.text.length];
        self.lastTextViewState = textView.text;
    } else{
        textView.text = self.lastTextViewState;
    }
}

- (IBAction)onReverseButtonTapped:(UIButton *)sender {
     NSMutableArray *words = [[NSMutableArray alloc]initWithArray:[self.textView.text componentsSeparatedByString:@" "]];
    for (NSString *word in words) {
        int i = 0;
        if (![word containsString:@"#"]) {
            
        }
    }
    
}


@end
