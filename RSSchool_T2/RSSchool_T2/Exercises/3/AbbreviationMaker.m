#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSMutableString* mutableA = [NSMutableString stringWithString:a];
    NSUInteger i = 0;
    NSUInteger j = 0;
    
    while (j < [b length] && [mutableA length] >= [b length]) {
        
        if (![[[mutableA substringWithRange:NSMakeRange(i, 1)] capitalizedString] isEqualToString:[[b substringWithRange:NSMakeRange(j, 1)] capitalizedString]]) {
            [mutableA replaceCharactersInRange:NSMakeRange(i, 1) withString:@""];
        } else {
            [mutableA replaceCharactersInRange:NSMakeRange(i, 1) withString:[b substringWithRange:NSMakeRange(j, 1)]];
            i++;
            j++;
        }
    }
    
    if ([mutableA containsString:b]){
        return @"YES";
    } else {
        return @"NO";
    }
}
@end
