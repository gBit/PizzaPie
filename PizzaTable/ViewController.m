//
//  ViewController.m
//  PizzaTable
//
//  Created by gBit on 2/12/13.
//  Copyright (c) 2013 gBit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
{
    NSDictionary *pizzerias;
    NSArray *pizzaKeys;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *myFile = [[NSBundle mainBundle]
                        pathForResource:@"pizzerias" ofType:@"plist"];
    pizzerias = [[NSDictionary alloc] initWithContentsOfFile:myFile];
    pizzaKeys = [[pizzerias allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
}

// Required UITableViewDataSource protocol
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [pizzerias count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
// Required UITableViewDataSource protocol
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                                 initWithStyle:UITableViewCellStyleSubtitle
                                 reuseIdentifier:@"cell"];
    }
    
    
    
    NSString *currentPizzeria = [pizzaKeys objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:currentPizzeria];
    
    NSString *phoneNumber = [pizzerias objectForKey:[pizzaKeys objectAtIndex:[indexPath row]]];
    [[cell detailTextLabel] setText:phoneNumber];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
