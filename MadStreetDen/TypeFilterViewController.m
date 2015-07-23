//
//  TypeFilterViewController.m
//  MadStreetDen
//
//  Created by GANESH BASKER on 23/07/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "TypeFilterViewController.h"

@interface TypeFilterViewController ()

@end

@implementation TypeFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [@"Filter" uppercaseString];
}

- (IBAction)filterClicked:(UIButton *)sender {
    UIButton *selectedButton = sender;
    BOOL selected = selectedButton.selected;
        NSLog(@"Tag: %lu %d",selectedButton.tag,selected);
    [selectedButton setSelected:!selected];
    if (!selected == YES) {
        [selectedButton setBackgroundColor:[UIColor lightGrayColor]];
    }else {
        [selectedButton setBackgroundColor:[UIColor clearColor]];
    }
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

@end
