#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSString* newDay = [NSString stringWithFormat:@"%d%d", [day intValue]/10, [day intValue]%10];
    NSString* newMonth = [NSString stringWithFormat:@"%d%d", [month intValue]/10, [month intValue]%10];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterLongStyle;
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru_BY"];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSDate *date = [dateFormatter dateFromString: [NSString stringWithFormat:@"%@-%@-%@", newDay, newMonth, year]];
    [dateFormatter setDateFormat:@"dd MMMM, EEEE"];
    if (date) {
        return [dateFormatter stringFromDate:date];
    } else {
        return @"Такого дня не существует";
    }
}

@end
