//
//  Header.h
//  ScreenDesign
//
//  Created by 夏强 on 15/5/26.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#ifndef ScreenDesign_Header_h
#define ScreenDesign_Header_h

#define VIEW_SIZE (self.view.frame.size)
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define AUTO_MATE_WIDTH(width) (width * SCREEN_WIDTH /320.0)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define AUTO_MATE_HEIGHT(height) (height * SCREEN_HEIGHT /568.0)


#endif
