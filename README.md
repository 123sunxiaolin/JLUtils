## JLUtils

- author:Jack_lin
- [个人主站](https://123sunxiaolin.github.io)
- 项目介绍：整理一下在项目中经常的工具方法

####  更新记录
- 更新时间：2016-09-13
- 更新时间：2016-11-12
- 更新时间：2017-03-26

#### NSDictionary+JLUtils
- `- (NSString *)JL_jsonString;` //**转换成Json字符串**

- `- (NSData *)JL_jsonData;` //**转换成Json数据**

- `- (id)JL_objectOrNilForKey:(id)key` //**添加key对应的对象为空的处理**

- `- (NSString *)JL_stringForKey:(id)key;` //**返回字符串类型的对象**

- `- (NSString *)JL_stringOrEmptyStringForKey:(id)key;` //**返回不为空的字符串对象**

- `- (NSDictionary *)JL_dictionaryForKey:(id)key;` //** 返回字典类型的对象 **

- `- (NSArray *)JL_arrayForKey:(id)key;` //** 返回数组类型的对象 **

- `- (NSNumber *)JL_numberForKey:(id)key;` //** 返回NSNumber类型的对象 **

- `- (NSURL *)JL_urlForKey:(id)key;` //** 返回NSURL类型的对象 **

- `- (BOOL)JL_boolForKey:(id)key;` //** 返回bool类型 **

- `- (NSDate *)JL_dateForKey:(id)key;` //** 返回 ISO8601 格式字符串对应的日期 **

- `- (NSDate *)JL_dateForKeySince1970:(id)key;` //** 返回指定秒数对应的日期(since 1970) **

- `- (NSDate *)JL_dateForKey:(id)key withFormat:(NSString *)formatString;` //** 返回指定日期格式的NSDate对象 **



###NSData+Utils

- `- (NSDictionary *)toDictionary;` //**转换成字典**
- `- (NSString *)string;` //**转换成字符串**

###NSString+Utils
- `- (CGSize)sizeOfTextContentWidthWithFont:(UIFont *)wordFont givenSize:(CGSize)size;` //**计算指定格式下的文字段落尺寸(宽度不变，高度自动计算)**

- `- (CGSize)sizeOfTextContentHeightWithFont:(UIFont *)wordFont givenSize:(CGSize)size;` //**计算指定格式下的文字段落尺寸(高度不变，宽度自动计算)**
- `- (CGSize)sizeOfTextContentWithFont:(UIFont *)wordFont
                     paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle
                          givenSize:(CGSize)size;` //**计算指定格式下的文字段落尺寸(宽高自定义)**
                          
- `- (NSData *)data;` //**转换成数据**
- `- (NSDictionary *)dictionary;` //**转换成对应的字典**
- `- (NSString *)dateString;` //**转换日期字符串显示格式，如：2016-03-12 10:20:30转换为 20160312102030的方法**
- `- (NSDate *)date;` //**转换成对应时间对象的方法**
- `- (NSString *)dateStringFromTimeStamp;` //**将时间戳转换成日期字符串**
- `- (NSDate *)dateFromTimeStamp;` //**将时间戳转换成日期对象**

###NSDate+Utils

- `+ (NSString *)CurrentTime;` //**获取当前时间的字符串**
- `+ (NSString *)CurrentTimeAll;` //**获取指定日期的字符串**
- `- (NSString *)dueDateTime;` //**获取指定日期的时间戳:yyyyMMddHHmmss**
- `- (NSString *)unixTimeStamp;` //**获取指定日期的Unix时间戳**
- `- (long long)timeStamp;` //**返回数字类型的时间戳**

### UIView+Utils
- `- (UIImage *)screenShootWithScale:(CGFloat)scale targetImageSize:(CGSize)imageSize;` //**进行截图**

- `- (void)setCustomCornersWithRoundingCorners:(UIRectCorner)corners
                                cornerRadii:(CGSize)cornerRadii` //**自定义设置UIView圆角效果**



###Tools：通用工具类
- `+ (UIImage *)screenImageWithSize:(CGSize)imageSize;` // **获取当前屏幕的截图，包含整个屏幕**
- `+ (UIImage *)screenImageWithView:(UIView *)targetView Size:(CGSize)imageSize isOpaque:(BOOL)isOpaque scale:(CGFloat)scale;` // **获取当前屏幕的截图，包含整个屏幕**

###BaseObject：内部实现JSON解析的model基类

### NSObject+Utils
- `+ (BOOL)swizzleMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector error:(NSError **)error;` // **使用RunTime对原有的系统方法进行替换**

### NSArray+Utils
- `- (id)jack_objectAtIndex:(NSUInteger)index;` // **使用分类方法避免数组越界读取导致Crash的问题**

### NSMutableArray+Utils
- `- (id)jack_objectAtIndex:(NSUInteger)index` // **使用分类方法避免数组越界读取导致Crash的问题**
- `-(void)jack_addObject:(id)object` // **使用分类方法避免可变数组添加为nil对象导致Crash的问题**
