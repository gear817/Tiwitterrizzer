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
            [result appendString:@" #"];
            [result appendString:word];
            
        }else {
            [result appendString:@" "];
            [result appendString:word];
        }
        
        i++;
    }
    
    if ([result hasPrefix:@" "]) {
        result = [[NSMutableString alloc]initWithString:[result substringFromIndex:1]];
    }
    
    return result;
}


-(void)textViewDidChange:(UITextView *)textView {
    if ([textView.text hasPrefix:@" "]) {
        NSLog(@"Textview has space in front");
        textView.text = [textView.text substringFromIndex:1];
    }
    
    if (textView.text.length <= 140) {
        self.countLabel.text = [NSString stringWithFormat:@"Count: %i",(int)self.textView.text.length];
        self.lastTextViewState = textView.text;
    } else{
        textView.text = self.lastTextViewState;
    }
}

- (IBAction)onReverseButtonTapped:(UIButton *)sender {
    NSMutableArray *words = [[NSMutableArray alloc]initWithArray:[self.textView.text componentsSeparatedByString:@" "]];
    NSMutableString *result = [NSMutableString new];
    
    
    for (NSString *word in words) {
        
        
        if (![word containsString:@"#"]) {
            NSMutableString *reversedWord = [NSMutableString new];
            
            for (int i = (int)word.length - 1; i >= 0; i--) {
                //Reserse code              //string                        //char
                [reversedWord appendString:[NSString stringWithFormat:@"%c",[word characterAtIndex:i]]];
            }
            [result appendString:@" "];
            [result appendString:reversedWord];
            
        }else {
            [result appendString:@" "];
            [result appendString:word];
        }
        
        
        
    }
    
    if ([result hasPrefix:@" "]) {
        result = [[NSMutableString alloc]initWithString:[result substringFromIndex:1]];
    }
    
    self.textView.text = result;
}


@end
