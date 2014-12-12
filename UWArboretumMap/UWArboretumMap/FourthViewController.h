//
//  FourthViewController.h
//  UWArboretumMap
//
//  Created by Brittany Bentley on 10/18/14.
//  Copyright (c) 2014 Brittany Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>

@interface FourthViewController : UIViewController <AGSMapViewLayerDelegate>//, AGSQueryTaskDelegate, AGSPopupsContainerDelegate>
@property (strong, nonatomic) IBOutlet AGSMapView *mapView;
//@property (nonatomic, strong) AGSFeatureSet *walkFeatureSet;

@end
