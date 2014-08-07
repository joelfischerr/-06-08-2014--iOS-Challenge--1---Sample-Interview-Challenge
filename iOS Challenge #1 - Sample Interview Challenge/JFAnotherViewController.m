//
//  JFAnotherViewController.m
//  iOS Challenge #1 - Sample Interview Challenge
//
//  Created by Joel Fischer on 07/08/14.
//  Copyright (c) 2014 Joel Fischer. All rights reserved.
//

#import "JFAnotherViewController.h"

@interface JFAnotherViewController ( )

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation JFAnotherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        if (self) {
                // Custom initialization
        }
        return self;
}

- (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view.

        [self.label setHidden:YES];

        [self.imageView setUserInteractionEnabled:YES];

        UITapGestureRecognizer *tapGestureRecognizer =
                [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];

        [self.imageView addGestureRecognizer:tapGestureRecognizer];

        tapGestureRecognizer.delegate = self;
}

- (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)handleTapFrom:(UITapGestureRecognizer *)recognizer {

        NSLog(@"handle tap");

        [self.label setHidden:!(self.label.isHidden)];
}

@end
