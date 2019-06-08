
Map Overlay Tile
=========

## Map Overlay Tile add diffrent type of Overlay on MAPView
------------
 Added Some screens here.
 
[![](https://github.com/pawankv89/MAPOverlayTile/blob/master/images/screen_1.png)]
[![](https://github.com/pawankv89/MAPOverlayTile/blob/master/images/screen_2.png)]


## Usage
------------
 You can add this method in your `UICollectionView`.


```objective-c
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

```
 Add MKMapView Delegate 

```objective-c

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.

//Load Tiles
[self tileOverlayRenderer];

//Center Map Zoom Location
[self zoomToCurrentLocation:CLLocationCoordinate2DMake(40.690549,-73.966133)];
}

- (void)zoomToCurrentLocation:(CLLocationCoordinate2D)coordinate{

MKCoordinateRegion region = self.mapView.region;
region.center.latitude = coordinate.latitude;
region.center.longitude = coordinate.longitude;
region.span.latitudeDelta /= 2.0;
region.span.longitudeDelta /= 2.0;
[self.mapView setRegion:region animated:YES];
}

```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
