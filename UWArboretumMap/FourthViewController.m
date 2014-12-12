//
//  FourthViewController.m
//  UWArboretumMap
//
//  Created by Brittany Bentley on 10/18/14.
//  Created for the University of Washington Botanical Gardens
//  Licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License
//
//  Any sample code provided by ESRI falls under their copyright, as below:
//
// Copyright 2012 ESRI
//
// All rights reserved under the copyright laws of the United States
// and applicable international laws, treaties, and conventions.
//
// You may freely redistribute and use this sample code, with or
// without modification, provided you include the original copyright
// notice and use restrictions.
//
// See the use restrictions at http://help.arcgis.com/en/sdk/10.0/usageRestrictions.htm
//



#import "FourthViewController.h"

@interface FourthViewController ()
@property (nonatomic, strong) AGSWebMap *webmap;
@property (nonatomic, strong) AGSPopupsContainerViewController *popupVC;

@end



@implementation FourthViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Get the public webmap from the website
    _webmap = [[AGSWebMap alloc] initWithItemId:@"323fc44e614c49fb8af38fc1aed1bac9" credential:nil];
    
    
    //set delegates
    _webmap.delegate = self;
    [_webmap openIntoMapView:self.mapView];
    self.mapView.layerDelegate = self;
    

    //Display user location
    //Required permission added to Info.plist for iOS8
    [self.mapView.locationDisplay startDataSource];
}



- (void)popupsContainerDidFinishViewingPopups:(id<AGSPopupsContainer>)popupsContainer{
    [self.webmap cancelFetchPopups];
}



-(void)mapViewDidLoad:(AGSMapView *)mapView{
    //do something now that the map is loaded
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - webMap Delegates

- (void) webMapDidLoad:(AGSWebMap *)webMap{
    NSLog(@"WebMap loaded successfully");
}



-(void) webMap:(AGSWebMap *)webMap didFailToLoadWithError:(NSError *)error{
    
    NSLog(@"webmap failed to load");
    NSLog(@"Error while loading webmap: %@", [error localizedDescription]);
}



-(void)webMap:(AGSWebMap *)webMap didFailToLoadLayer:(AGSWebMapLayerInfo *)layerInfo baseLayer:(BOOL)baseLayer federated:(BOOL)federated withError:(NSError *)error{
    
    NSLog(@"Error while loading webmap: %@", [error localizedDescription]);
    [_webmap continueOpenAndSkipCurrentLayer];
}


-(void) webMap:(AGSWebMap *)webMap didFetchPopups:(NSArray *)popups forExtent:(AGSEnvelope *)extent{
    
    if (popups.count > 0){
        if (!_popupVC){
            _popupVC = [[AGSPopupsContainerViewController alloc] initWithPopups:popups usingNavigationControllerStack:false];
            _popupVC.modalPresenter = self.view.window.rootViewController;
            _popupVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        }
    }
}



-(void) webMap:(AGSWebMap *)webMap didFinishFetchingPopupsForExtent:(AGSEnvelope *)extent{
    
}



#pragma mark - AGSPopupsContainerDelegate methods
/*
 
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end

