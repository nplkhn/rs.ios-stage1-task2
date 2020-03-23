#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSMutableArray<NSNumber*>* fibNumbers = [NSMutableArray arrayWithArray:@[@0,@1]];
    while ([fibNumbers[fibNumbers.count - 1] intValue] * [fibNumbers[fibNumbers.count - 2] intValue] < [number intValue]) {
        NSNumber* sum = [NSNumber numberWithInt:[fibNumbers[fibNumbers.count - 1] intValue] + [fibNumbers[fibNumbers.count - 2] intValue]];
        [fibNumbers addObject:sum];
    }
    NSLog(@"%@", fibNumbers);
    NSNumber* result;
    if ([fibNumbers[fibNumbers.count - 1] intValue] * [fibNumbers[fibNumbers.count - 2] intValue] == [number intValue]) {
        result = @1;
    } else {
        result = @0;
    }
    
    return @[fibNumbers[fibNumbers.count - 2], fibNumbers[fibNumbers.count - 1], result];
}
@end
