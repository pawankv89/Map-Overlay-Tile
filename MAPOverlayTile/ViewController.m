//
//  ViewController.m
//  MAPOverlayTile
//
//  Created by Pawan kumar on 9/12/17.
//  Copyright © 2017 Pawan kumar. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Load Tiles
    [self tileOverlayRenderer];
    
    //Center Map Zoom Location
    [self zoomToCurrentLocation:CLLocationCoordinate2DMake(40.690549,-73.966133)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    return nil;
}


#pragma mark - Custom TileOverlay on Map

-(void)tileOverlayRenderer{
    
    for (id<MKOverlay> overlayToRemove in self.mapView.overlays)
    {
        if ([overlayToRemove isKindOfClass:[MKTileOverlay class]])
        {
            [self.mapView removeOverlay:overlayToRemove];
        }
    }
   
    NSString *pbOverLayURL = [NSString stringWithFormat:@"http://tile.openstreetmap.org/{z}/{x}/{y}.png?"];
    
    MKTileOverlay *osmOverlay = [[MKTileOverlay alloc] initWithURLTemplate:pbOverLayURL];
    
    // This lets MapKit know that the provided tiles can replace the MapKit provided
    // tiles, when this is set to YES the MapKit tiles will not be rendered.
    osmOverlay.canReplaceMapContent = YES;
    
    [_mapView addOverlay:osmOverlay];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay
{
    if([overlay isKindOfClass:[MKTileOverlay class]]) {
        
        return [[MKTileOverlayRenderer alloc] initWithTileOverlay:overlay];
        
    }
    return nil;
}

- (void)zoomToCurrentLocation:(CLLocationCoordinate2D)coordinate{
    
    MKCoordinateRegion region = self.mapView.region;
    region.center.latitude = coordinate.latitude;
    region.center.longitude = coordinate.longitude;
    region.span.latitudeDelta /= 2.0;
    region.span.longitudeDelta /= 2.0;
    [self.mapView setRegion:region animated:YES];
}


@end
