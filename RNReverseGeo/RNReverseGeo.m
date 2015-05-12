//
//  RNReverseGeo.m
//  RNReverseGeo
//
//  Created by Aaron Saunders on 5/11/15.
//  Copyright (c) 2015 Clearly Innovative Iinc. All rights reserved.
//

#import "RNReverseGeo.h"
#import "RCTLog.h"

@implementation RNReverseGeo

// Expose this module to the React Native bridge
RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(geoCodeAddress:(NSString *)addressString callback:(RCTResponseSenderBlock)callback)
{
    
    CLGeocoder *reverseGeocoder = [[CLGeocoder alloc] init];
    
    [reverseGeocoder geocodeAddressString:addressString completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (error){
             // Craft a failure message
             NSDictionary *errDict = @{
                                       @"success" : @NO,
                                       @"error"  : error.localizedDescription
                                       };
             RCTLogError(@"Error: %@ with address: %@", addressString, error.localizedDescription);
             
             // execute callback with error...
             callback(@[errDict]);
         } else {
             
             CLPlacemark *myPlacemark = [placemarks objectAtIndex:0];
             MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:myPlacemark];
             
             // create the response object
             NSDictionary *successDict = @{
                                           @"success" : @YES,
                                           @"address"  : myPlacemark.addressDictionary,
                                           @"coords" : @{
                                                   @"latitude": [[NSString alloc] initWithFormat:@"%f", placemark.coordinate.latitude],
                                                   @"longitude": [[NSString alloc] initWithFormat:@"%f", placemark.coordinate.longitude]
                                                   }
                                           };
             
             // execute callback with success...
             callback(@[successDict]);
         }
         
         return;
         
     }];
}
@end
