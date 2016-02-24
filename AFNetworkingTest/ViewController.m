//
//  ViewController.m
//  AFNetworkingTest
//
//  Created by Fancy on 16/2/24.
//  Copyright © 2016年 Fancy. All rights reserved.
//
#import <SystemConfiguration/SystemConfiguration.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "ViewController.h"
#import "AFNetworking.h"
#import "NSDictionary+JSONString.h"
#import "NSObject+JSONCategories.h"
#ifdef DEBUG
#define posturl    @"http://10.244.171.106/SmartPen/user.json"
#define geturl      @"http://10.244.171.106/SmartPen/securityQuestion.json"
#else 
#define posturl    @""
#define geturl     @""
#endif
@interface ViewController ()
- (IBAction)postJson:(id)sender;

- (IBAction)getJson:(id)sender;
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

- (IBAction)postJson:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSDictionary *dict =@{@"username":@"hehe",@"pwd":@"hahahah"};
    
    [manager POST:posturl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject){
    
        NSLog(@"返回结果是：%@",responseObject);
        NSData *data =[responseObject JSONString];
        NSLog(@"%@",data);
        
    } failure:^(AFHTTPRequestOperation *operation,NSError *error){
        NSLog(@"%@",error);
        
    }];
    
    
    
}

- (IBAction)getJson:(id)sender {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:geturl parameters:nil success:^(AFHTTPRequestOperation *operation,id responseObject){
         NSLog(@"%@",responseObject);
        NSData *data =[responseObject JSONString];
        NSLog(@"%@",data);

     
     
     }failure:^(AFHTTPRequestOperation *operation ,NSError *error)
    { NSLog(@"%@",error);
    }];
}
@end
