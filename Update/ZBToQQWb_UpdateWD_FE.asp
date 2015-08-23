'备份设置Begin 
Sub ZBToQQWb_BG()
  Dim tmpSng2,tmpSng
'  If ZBToQQWb_Chajian="2.2" then
 '   tmpSng=LoadFromFile(BlogPath & "\PLUGIN\ZBToQQWb\config.asp","utf-8")
' else
	 tmpSng=LoadFromFile(BlogPath & "\PLUGIN\ZBToQQWb\function.asp","utf-8")
'  end if
   Call SaveValueForSetting(tmpSng,True,"Boolean","ZBToQQWb_FUpdateE",True)  
   Call SaveToFile(BlogPath & "\PLUGIN\ZBToQQWb\function.asp",tmpSng,"utf-8",False)

 '   tmpSng2=Split(Split(tmpSng,"'配置信息End")(0),"'配置信息Begin")(1)
    If LoadFromFile(BlogPath & "\Include\ZBToQQWb_ConfigBackup.asp","utf-8")<>"" Then
    tmpSng=LoadFromFile(BlogPath & "\Include\ZBToQQWb_ConfigBackup.asp","utf-8")
    Call SaveToFile(BlogPath & "\PLUGIN\ZBToQQWb\cfg.asp",tmpSng,"utf-8",False)
    End If

End Sub
'备份设置End
	 Response.Write "<br/>欢迎使用ZBToQQWb!<Br/>"

   Call ZBToQQWb_BG


Function LoadSetting(settingtype,name)
 Call LoadValueForSetting(tmpSng,True,settingtype,name,Null)
End Function

Function SaveSetting(settingtype,setname,content)
 SaveSetting=SaveValueForSetting(tmpSng,True,settingtype,setname,content)
End Function

