nLog('lib文件')
function getThisPage(界面列表s)
    -- body
    nLog('获取当前界面')
    for i,v in pairs(界面列表s) do
       -- bodys
       nLog(v.界面特征[1])
       x,y = findMultiColorInRegionFuzzy( v.界面特征[2],v.界面特征[3], v.界面特征[4], v.界面特征[5], v.界面特征[6],v.界面特征[7], v.界面特征[8])
       if x > -1 and y > -1 then   --如果在指定区域找到某点符合条件
           return v.界面特征[1];
                --并跳出循环
            
        end
    end
    return "未知界面"
end
function touchTouch(x,y)
	touchDown(0, x,y)
	mSleep(20)
	touchMove(0, x,y)
	mSleep(20)
	touchUp(0, x,y)
end
--查找为word的字符位置。
function getWord(word,x1,y1,x2,y2)
    -- body
local tab = {
"0001c001e003c003c0079007840f0103804078100784003d000340001e0001e0001c000000000000300078007800f800f401f101e040e0103c0403e1003e4001f0001f0000f8000f00000000000000000f000f001f001f003e4034103c040e0101e0400b1000fc0007800078000280003$AAA$198$18$50",
}
local index = addTSOcrDictEx(tab)

x, y = tsFindText(index,word,x1,y1,x2,y2,"7C7B7C , 333333" ,90)
     return x,y;

end

function 彩跳准备(x,y,word)
    -- body
    nLog("进入准备")
    x1,y1= findMultiColorInRegionFuzzy( 0xfffbff, "72|18|0xfffbff,28|62|0xfffbff,-2|40|0xf7fbf7", 90, 8, 194, 126, 1156)

    touchTouch(x1,y1);
    mSleep(1000)
    --用户名
    x2,y2=getWord(word,226, 484, 333, 1158)
    nLog(x2.." "..y2)
    if x2 > -1 and y2 > -1 then   --如果在指定区域找到某点符合条件
        touchTouch(x2,y2);
    end
end
function 准备开始(x,y)
    -- body
    nLog("准备开始")
    x1,y1 = findMultiColorInRegionFuzzy( 0x31c2b5, "32|-1|0x31c2b5,30|26|0x31c2b5,1|26|0x31c2b5", 90, 205, 889, 510, 978)
    nLog(x..","..y)
    if x1 > -1 and y1 > -1 then
        nLog("已准备")
    else
        touchTouch(x,y)
    end
    
end
function 彩跳建房()
    -- body
    nLog("进入准备")
    --多人作战
    x1,y1 = findMultiColorInRegionFuzzy( 0xffffff, "203|2|0xffffff,-6|287|0xad85de,220|285|0xad85de", 90, 11, 742, 708, 1090)
    touchTouch(x1,y1);
    mSleep(1000)
end
function 开始挑战(x,y)
    -- body
    nLog("开始挑战")
    x1,y1 = findMultiColorInRegionFuzzy( 0xff9e19, "14|2|0xff9e19,5|7|0xff9e19", 90, 237, 758, 492, 874)
    -- x1,y1 = findMultiColorInRegionFuzzy( 0x31c2b5, "32|-1|0x31c2b5,30|26|0x31c2b5,1|26|0x31c2b5", 90, 205, 889, 510, 978)
    nLog(x1..","..y1)
    if x1 > -1 and y1 > -1 then
        nLog("互关已")
    else
        touchTouch(352,  829)
        x3,y3 = findMultiColorInRegionFuzzy( 0x31c2b5, "28|-1|0x31c2b5,-2|23|0x31c2b5,25|25|0x31c2b5", 90, 39, 424, 680, 569)
        if x3 > -1 and y3 > -1 then
        touchTouch(546,  926)
        else 
        touchTouch(x3,  x3)
        touchTouch(546,  926)
        end
    end
   x2,y2 = findMultiColorInRegionFuzzy( 0xff9e19, "284|3|0xff9e19,2|67|0xff9e19,281|69|0xff9e19", 90, 39, 856, 704, 1012)
    nLog(x2,y2)
    if x2 > -1 and y2 > -1 then
        nLog("可以开始")
        touchTouch(x2,y2)
    end
end