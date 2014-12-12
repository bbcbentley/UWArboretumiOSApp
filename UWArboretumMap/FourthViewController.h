//
//  FourthViewController.h
//  UWArboretumMap
//
//  Created by Brittany Bentley on 10/18/14.
//  Created for the University of Washington Botanical Gardens
//  Licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License
//



#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>



@interface FourthViewController : UIViewController <AGSMapViewLayerDelegate, AGSWebMapDelegate, AGSPopupsContainerDelegate>
@property (strong, nonatomic) IBOutlet AGSMapView *mapView;


@end

