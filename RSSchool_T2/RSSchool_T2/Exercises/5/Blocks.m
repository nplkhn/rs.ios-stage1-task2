#import "Blocks.h"

@interface Blocks()

@property (nonatomic) NSArray* array;

@end

@implementation Blocks

-(BlockA)blockA {
    return [^(NSArray* array){
        self.array = array;
    } copy];
}

-(BlockB)blockB {
    return [^(Class class) {
        NSArray* filteredArray = [self.array filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
            return [evaluatedObject isKindOfClass:class];
        }]];
        if (class == [NSNumber class]) {
            self.blockC([filteredArray valueForKeyPath:@"@sum.self"]);
        } else if (class == [NSString class]) {
            self.blockC([filteredArray componentsJoinedByString:@""]);
        } else if (class == [NSDate class]) {
            filteredArray = [filteredArray sortedArrayUsingSelector:@selector(compare:)];
            NSDateFormatter* formatter = [NSDateFormatter new];
            [formatter setDateFormat:@"dd.MM.yyyy"];
            self.blockC([formatter stringFromDate:[filteredArray lastObject]]);
        }
    } copy];
}


@end

