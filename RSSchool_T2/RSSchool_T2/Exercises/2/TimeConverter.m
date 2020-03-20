#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSNumberFormatter* numberFormatter = [NSNumberFormatter new];
    [numberFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_GB"]];
    [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    
    int intHours = [hours intValue];
    int intMinutes = [minutes intValue];
    if (intMinutes >= 60 || intHours >= 24 || intMinutes < 0 || intHours < 0) {
        return @"";
    }
    if (intMinutes == 0) {
        return [NSString stringWithFormat:@"%@ o' clock", [numberFormatter stringFromNumber:[NSNumber numberWithInt:intHours]]];
    } else if (intMinutes == 1) {
    return [NSString stringWithFormat: @"%@ minute past %@", [numberFormatter stringFromNumber:[NSNumber numberWithInt:intMinutes]], [numberFormatter stringFromNumber: [NSNumber numberWithInt:intHours]]];
    } else if (intMinutes == 15) {
        return [NSString stringWithFormat:@"quarter past %@", [numberFormatter stringFromNumber:[NSNumber numberWithInt:intHours]]];
    } else if (intMinutes == 45) {
        return [NSString stringWithFormat:@"quarter to %@", [numberFormatter stringFromNumber:[NSNumber numberWithInt:intHours + 1]]];
    } else if (intMinutes == 30) {
        return [NSString stringWithFormat:@"half past %@", [numberFormatter stringFromNumber:[NSNumber numberWithInt:intHours]]];
    } else if (intMinutes < 30) {
        NSMutableString* timeString = [NSMutableString stringWithFormat: @"%@ minutes past %@", [numberFormatter stringFromNumber:[NSNumber numberWithInt:intMinutes]], [numberFormatter stringFromNumber: [NSNumber numberWithInt:intHours]]];
        [timeString replaceOccurrencesOfString:@"-" withString:@" " options:NSCaseInsensitiveSearch range:NSMakeRange(0, [timeString length])];
        return timeString;
    } else {
        NSMutableString* timeString = [NSMutableString stringWithFormat: @"%@ minutes to %@", [numberFormatter stringFromNumber:[NSNumber numberWithInt:60 - intMinutes]], [numberFormatter stringFromNumber: [NSNumber numberWithInt:1 + intHours]]];
        [timeString replaceOccurrencesOfString:@"-" withString:@" " options:NSCaseInsensitiveSearch range:NSMakeRange(0, [timeString length])];
        return timeString;;
    }
}
@end
