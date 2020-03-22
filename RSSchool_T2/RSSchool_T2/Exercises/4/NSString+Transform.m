#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    
    // Creatin a string for manipulations
    NSString* string = [NSString stringWithString:self];
    
    // Clear string from multiple whitespaces
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSRegularExpression *whitespaceRegex = [NSRegularExpression regularExpressionWithPattern:@"  +" options:NSRegularExpressionCaseInsensitive error:nil];
    string = [whitespaceRegex stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@" "];
    
    // Check if string is null and return @"" in this case
    if ([string isEqualToString:@""]) {
        return @"";
    }
    
    // Creating sets for characters in string and for characters of alphabet
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:[string lowercaseString]];
    NSCharacterSet *alphabet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    NSMutableArray* substring = [NSMutableArray arrayWithArray: [string componentsSeparatedByString:@" "]];
    
    // Check if string is pangram
    // Case if pangram
    if ([set isSupersetOfSet:alphabet]) {
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"[aeiouy]" options:NSRegularExpressionCaseInsensitive error:nil];
        [substring enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableString* word = (NSMutableString*)obj;
            NSArray* matches = [regex matchesInString:word
                                                       options:0
                                                         range:NSMakeRange(0, word.length)];
            for (NSTextCheckingResult* matchResult in matches) {
                NSString* match = [word substringWithRange:matchResult.range];
                word = (NSMutableString*)[word stringByReplacingCharactersInRange:matchResult.range withString:[match capitalizedString]];
            }
            [substring replaceObjectAtIndex:idx withObject:[NSString stringWithFormat:@"%lu%@", [matches count], word]];
        }];
        
        // Sort string in the right order
        NSMutableArray* sortedSubstrings = [NSMutableArray new];
        NSUInteger i = 0;
        while ([sortedSubstrings count] < [substring count]) {
            for (NSUInteger j = 0; j < [substring count]; j++) {
                if ([[substring[j] substringWithRange:NSMakeRange(0, 1)] intValue] == i) {
                    [sortedSubstrings addObject:substring[j]];
                }
            }
            i++;
        }
        return [sortedSubstrings componentsJoinedByString:@" "];
    }
    // Case if not pangram
    else {
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"[bcdfghjklmnpqrstvwxz]" options:NSRegularExpressionCaseInsensitive error:nil];
        [substring enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableString* word = (NSMutableString*)obj;
            NSArray* matches = [regex matchesInString:word
                                                       options:0
                                                         range:NSMakeRange(0, word.length)];
            for (NSTextCheckingResult* matchResult in matches) {
                NSString* match = [word substringWithRange:matchResult.range];
                word = (NSMutableString*)[word stringByReplacingCharactersInRange:matchResult.range withString:[match capitalizedString]];
            }
            [substring replaceObjectAtIndex:idx withObject:[NSString stringWithFormat:@"%lu%@", [matches count], word]];
        }];
        
        // Sort string in the right order
        NSMutableArray* sortedSubstrings = [NSMutableArray new];
        NSUInteger i = 0;
        while ([sortedSubstrings count] < [substring count]) {
            for (NSUInteger j = 0; j < [substring count]; j++) {
                if ([[substring[j] substringWithRange:NSMakeRange(0, 1)] intValue] == i) {
                    [sortedSubstrings addObject:substring[j]];
                }
            }
            i++;
        }
        return [sortedSubstrings componentsJoinedByString:@" "];
    }
}

@end
