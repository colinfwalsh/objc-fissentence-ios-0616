//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Colin Walsh on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"


@interface FISSentence ()

@property (nonatomic, readwrite) NSString* sentence;

-(void)assembleSentence;
-(BOOL)validWord:(NSString*)word;
-(BOOL)validPunctuation:(NSString*)punctuation;
-(BOOL)validIndex:(NSUInteger)index;

@end

@implementation FISSentence
//Private Methods
-(void)assembleSentence{
    
    NSString* space = [self.words componentsJoinedByString:@" "];
    
    self.sentence = [space stringByAppendingString:self.punctuation];
    
}
-(BOOL)validWord:(NSString*)word{
    
    if ([word length] == 0 || word == nil) {
        return NO;
    }
    else if([word isEqualToString:@" "]){
        return NO;
    }
    else {
        return YES;
    }
    
}
-(BOOL)validPunctuation:(NSString*)punctuation{
    
    if (punctuation == nil) {
        return NO;}
    
    NSString* punctuationIsValid = @".?!,;:—";
    if (![punctuationIsValid containsString:punctuation]) {
        return NO; }
    
    else {
        return YES;
    }
}
-(BOOL)validIndex:(NSUInteger)index{
    if (index >= [self.words count]){
        return NO;}
    else{
        return YES;}
    }


//Public Methods
-(void)addWord:(NSString*)word{
    
    if ([self validWord:word] == NO) {
        [self assembleSentence];
    }
    else {
        [self.words addObject:word];
        [self assembleSentence];
    }
}
-(void)addWords:(NSArray*)words withPunctuation:(NSString *)punctuation{
    
    self.punctuation = punctuation;
    
    if ([words  isEqual: @[]] || words == nil){
        return;}
    
    if (![self validPunctuation:punctuation]) {
        return;
    }
    
    for (NSString* wordsToAdd in words) {
        if ([self validWord:wordsToAdd]) {
            [self.words addObject:wordsToAdd];
        }
    }
    
    [self assembleSentence];
}
-(void)removeWordAtIndex:(NSUInteger)index{
    if (![self validIndex:index]) {
        [self assembleSentence];
    }
    else {
        [self.words removeObjectAtIndex:index];
        [self assembleSentence];
    }
}
-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index{
    if (![self validIndex:index]) {
        [self assembleSentence];
    }
    else {
        [self.words insertObject:word atIndex:index];
        [self assembleSentence];
    }
    
}
-(void)replacePunctuationWithPunctuation:(NSString*)punctuation{
    
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
        [self assembleSentence];
    }
    else {
        [self assembleSentence];
    }
    
}
-(void)replaceWordAtIndex:(NSUInteger) index withWord:(NSString *)word{
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words replaceObjectAtIndex:index withObject:word];
        [self assembleSentence];
    }
    else {
        [self assembleSentence];}
    }

@end
