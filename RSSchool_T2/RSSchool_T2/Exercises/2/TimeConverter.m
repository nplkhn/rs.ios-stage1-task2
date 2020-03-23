#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[@"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen", @"twenty", @"twenty one", @"twenty two", @"twenty three", @"twenty four", @"twenty five", @"twenty six", @"twenty seven", @"twenty eight", @"twenty nine"] forKeys:@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14, @15, @16, @17, @18, @19, @20, @21, @22, @23, @24, @25, @26, @27, @28, @29]];
    int intHours = [hours intValue];
    int intMinutes = [minutes intValue];
    
    if (intMinutes > 59) {
        return @"";
    } else if (intMinutes == 0) {
        return [NSString stringWithFormat:@"%@ o' clock", [dict objectForKey:[NSNumber numberWithInt:intHours]]];
    } else if (intMinutes == 1) {
        return [NSString stringWithFormat:@"%@ minute past %@", [dict objectForKey:[NSNumber numberWithInt:intMinutes]], [dict objectForKey:[NSNumber numberWithInt:intHours]]];
    } else if (intMinutes == 15) {
        return [NSString stringWithFormat:@"quarter past %@", [dict objectForKey:[NSNumber numberWithInt:intHours]]];
    } else if (intMinutes == 45) {
        return [NSString stringWithFormat:@"quarter to %@", [dict objectForKey:[NSNumber numberWithInt:intHours + 1]]];
    } else if (intMinutes == 30) {
        return [NSString stringWithFormat:@"half past %@", [dict objectForKey:[NSNumber numberWithInt:intHours]]];
    } else if (intMinutes < 30) {
        return [NSString stringWithFormat:@"%@ minutes past %@", [dict objectForKey:[NSNumber numberWithInt:intMinutes]], [dict objectForKey:[NSNumber numberWithInt:intHours]]];
    } else {
        return [NSString stringWithFormat:@"%@ minutes to %@", [dict objectForKey:[NSNumber numberWithInt:60 - intMinutes]], [dict objectForKey:[NSNumber numberWithInt:intHours + 1]]];
    }
}
@end
