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

- (void)handleTapFrom:(UITapGestureRecognizer *)recognizer {

        NSLog(@"handle tap");

        [self.label setHidden:!(self.label.isHidden)];
}

@end
