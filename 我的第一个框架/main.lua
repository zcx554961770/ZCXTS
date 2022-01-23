nLog('我的框架封装')
require("TSLib")

init(0)

require("lib")
require("page")

require "TSLib"
--乘客
function 乘客运行()
    -- body
    currentPage =  getThisPage(界面列表);
    nLog("获取的界面 "..currentPage)
    while (true) do
        if currentPage=="幻彩选图界面" then 彩跳准备(x,y,word) 
        elseif currentPage=="准备界面" then 准备开始(341,  927)
        elseif currentPage=="完成界面" then touchTouch(290, 1206)
        elseif currentPage=="离房界面" then touchTouch(290, 1206)
        elseif currentPage=="离房界面2" then touchTouch(357,1200)
        end
        currentPage =  getThisPage(界面列表);
        nLog("获取的界面 "..currentPage)
        mSleep(1000)
    end
end
--司机
function 司机运行()
    -- body
    currentPage =  getThisPage(司机界面列表);
    nLog("获取的界面 "..currentPage)
    while (true) do
        if currentPage=="多人界面" then 彩跳建房() 
        elseif currentPage=="挑战界面" then 开始挑战( 356,  835)
        elseif currentPage=="战斗界面" then touchTouch(36,   65)
        elseif currentPage=="放弃界面" then touchTouch( 79, 1233)
        elseif currentPage=="确认放弃界面" then 
            if (isColor( 490,  840, 0x31c2b5, 85)) then touchTouch( 490,  840)
                end
        end
        mSleep(1000)
        currentPage =  getThisPage(司机界面列表);
        nLog("获取的界面 "..currentPage)
        
    end
end
--ui
w,h = getScreenSize()
UINew(1,"第1页","确定","取消","uiconfig.dat",0,0,w,h,"255,255,255","255,255,255","","dot",1,15,"left")
-- UIRadio(1,"radio0","测试","0")
UICombo(1,"角色","乘客,司机","0")
UIShow()
--头前AAA
word="AAA"
if 角色 == "乘客" then--返回值为字符型
    toast("乘客")
    乘客运行()
elseif 角色 == "司机" then
    toast("司机")
    司机运行()
end


