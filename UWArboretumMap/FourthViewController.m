//
//  FourthViewController.m
//  UWArboretumMap
//
//  Created by Brittany Bentley on 10/18/14.
//  Copyright (c) 2014 Brittany Bentley. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()
@property (nonatomic, strong)AGSQuery *walksQuery;
@property (nonatomic, strong)AGSQueryTask *walksQueryTask;
@property (nonatomic, strong) NSMutableArray *walksGraphics;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //Load all the appropriate layers into the map
    NSURL *photoLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/Basemaps/MapServer"];
    AGSDynamicMapServiceLayer *photoLayer = [AGSDynamicMapServiceLayer dynamicMapServiceLayerWithURL:photoLayerURL];
    [self.mapView addMapLayer:photoLayer withName:@"Basemap Tile Layer"];
    
    /*NSURL *transportLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/TransportationBasemap/MapServer"];
    AGSDynamicMapServiceLayer *transportLayer = [AGSDynamicMapServiceLayer dynamicMapServiceLayerWithURL:transportLayerURL];
    [self.mapView addMapLayer:transportLayer withName:@"Transport Layer"];*/
    
    NSURL *walksLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/0"];
    AGSFeatureLayer *walksLayer = [AGSFeatureLayer featureServiceLayerWithURL:walksLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:walksLayer withName:@"Walks Layer"];
    
    NSURL *gardensLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/1"];
    AGSFeatureLayer *gardensLayer = [AGSFeatureLayer featureServiceLayerWithURL:gardensLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:gardensLayer withName:@"Gardens Layer"];
    
    NSURL *trailsLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/9"];
    AGSFeatureLayer *trailsLayer = [AGSFeatureLayer featureServiceLayerWithURL:trailsLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:trailsLayer withName:@"Trails Layer"];
    
    NSURL *bedsLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/13"];
    AGSFeatureLayer *bedsLayer = [AGSFeatureLayer featureServiceLayerWithURL:bedsLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:bedsLayer withName:@"Beds Layer"];
    
    NSURL *massesLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/11"];
    AGSFeatureLayer *massesLayer = [AGSFeatureLayer featureServiceLayerWithURL:massesLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:massesLayer withName:@"Masses Layer"];
    
    NSURL *nativeMassesLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/12"];
    AGSFeatureLayer *nativeMassesLayer = [AGSFeatureLayer featureServiceLayerWithURL:nativeMassesLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:nativeMassesLayer withName:@"Native Masses Layer"];
    
    NSURL *parkingLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/7"];
    AGSFeatureLayer *parkingLayer = [AGSFeatureLayer featureServiceLayerWithURL:parkingLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:parkingLayer withName:@"Parking Layer"];
    
    NSURL *roadsLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/8"];
    AGSFeatureLayer *roadsLayer = [AGSFeatureLayer featureServiceLayerWithURL:roadsLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:roadsLayer withName:@"Roads Layer"];
    
    NSURL *benchesLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/5"];
    AGSFeatureLayer *benchesLayer = [AGSFeatureLayer featureServiceLayerWithURL:benchesLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:benchesLayer withName:@"Benches Layer"];
    
    NSURL *landmarksLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/6"];
    AGSFeatureLayer *landmarksLayer = [AGSFeatureLayer featureServiceLayerWithURL:landmarksLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:landmarksLayer withName:@"Landmarks Layer"];
    
    NSURL *waterLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/10"];
    AGSFeatureLayer *waterLayer = [AGSFeatureLayer featureServiceLayerWithURL:waterLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:waterLayer withName:@"Water Layer"];
    
    NSURL *boundaryLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/14"];
    AGSFeatureLayer *boundaryLayer = [AGSFeatureLayer featureServiceLayerWithURL:boundaryLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:boundaryLayer withName:@"Boundary Layer"];
    
    
    NSURL *plantsLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/3"];
    AGSFeatureLayer *plantsLayer = [AGSFeatureLayer featureServiceLayerWithURL:plantsLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:plantsLayer withName:@"Plants Layer"];
    
    //BUG: Figure out how to make squares transparent!
   /* NSURL *squaresLayerURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/15"];
    AGSFeatureLayer *squaresLayer = [AGSFeatureLayer featureServiceLayerWithURL:squaresLayerURL mode: AGSFeatureLayerModeSnapshot];
    [self.mapView addMapLayer:squaresLayer withName:@"Squares Layer"];*/
    
    //come up with popup info templates for displaying information
    
    /*NSMutableArray *popups = [[NSMutableArray alloc] init];
    
    
    NSURL *serviceURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/"];
    int layerId = 0;
    AGSPopupInfo *popupInfo = [self.webmap popupInfoForMapServiceLayerWithURL:serviceURL sublayerId:layerId];
    AGSPopup *popup = [AGSPopup popupWithGraphic:nil popupInfo:popupInfo];
    [popups addObject:popup];
    
    AGSPopupsContainerViewController *popupVC = [[AGSPopupsContainerViewController alloc] initWithPopups:popups usingNavigationControllerStack:false];*/
    
    /*NSURL *walksAttributesURL = [NSURL URLWithString:@"http://uwbgmaps.cfr.washington.edu/arcgis/rest/services/PublicFeatures/MapServer/0"];
    self.walksQueryTask = [[AGSQueryTask alloc] initWithURL:walksAttributesURL];
    
    self.walksQuery = [AGSQuery query];
    self.walksQueryTask.delegate = self;
    self.walksQuery.whereClause = @"Name like '%'";
    self.walksQuery.outFields = [NSArray arrayWithObjects: @"*", nil];
    [self.walksQueryTask executeWithQuery:self.walksQuery];*/

    
    
    //Focus map on the area of arboretum
    //BUG: Refine spatialReference values, zooming to west of arboretum
    AGSEnvelope *envelope = [AGSEnvelope envelopeWithXmin:1275983 ymin:232427 xmax:1284093 ymax:238830 spatialReference: [AGSSpatialReference spatialReferenceWithWKID:102748]];
    [self.mapView zoomToEnvelope:envelope animated:NO];
    
    
    //set delegates
    self.mapView.layerDelegate = self;

}

- (void)popupsContainerDidFinishViewingPopups:(id<AGSPopupsContainer>)popupsContainer{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)mapViewDidLoad:(AGSMapView *)mapView{
    //do something now that the map is loaded
    /*NSMutableArray *walksPopups = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [self.walksGraphics count]; i++){
        AGSGraphic *graphic = [self.walksGraphics objectAtIndex:i];
        AGSPopupInfo *popupInfo = [AGSPopupInfo popupInfoForGraphic:graphic];
        AGSPopup *popup = [AGSPopup popupWithGraphic: graphic popupInfo:popupInfo];
        [walksPopups addObject:popup];
    }
    
    AGSPopupsContainerViewController *walksPopupViewController = [[AGSPopupsContainerViewController alloc] initWithPopups:walksPopups usingNavigationControllerStack:FALSE];
    walksPopupViewController = UIModalTransitionStyleCoverVertical;
    walksPopupViewController.delegate = self;
    [self presentViewController:walksPopupViewController animated:YES completion:nil];*/
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)queryTask:(AGSQueryTask *)queryTask operation:(NSOperation *)op didExecuteWithFeatureSetResult:(AGSFeatureSet *)featureSet{
     self.walkFeatureSet = featureSet;
    
    for (int i = 0; i < [self.walkFeatureSet.features count]; i++){
        AGSGraphic *graphic = [AGSGraphic graphicWithFeature:[self.walkFeatureSet.features objectAtIndex: i]];
        [self.walksGraphics addObject:graphic];
    }
    
}

- (void)queryTask:(AGSQueryTask *)queryTask operation:(NSOperation *)op didFailWithError:(NSError *)error{
    NSLog(@"Error: %@", error);
}*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
