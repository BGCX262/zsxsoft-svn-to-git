'备份设置Begin 
Sub ZBToSnWb_BG()
  Dim tmpSng2,tmpSng
	 tmpSng=LoadFromFile(BlogPath & "\PLUGIN\ZBToSnWb\function.asp","utf-8")
   Call SaveValueForSetting(tmpSng,True,"Boolean","ZBToSnWb_FUpdateE",True)  
   Call SaveToFile(BlogPath & "\PLUGIN\ZBToSnWb\function.asp",tmpSng,"utf-8",False)
   If LoadFromFile(BlogPath & "\Include\ZBToSnWb_ConfigBackup.asp","utf-8")<>"" Then
   tmpSng=LoadFromFile(BlogPath & "\Include\ZBToSnWb_ConfigBackup.asp","utf-8")
   Call SaveToFile(BlogPath & "\PLUGIN\ZBToSnWb\cfg.asp",tmpSng,"utf-8",False)
   End If

End Sub
'备份设置End
	 Response.Write "<br/>欢迎使用ZBToSnWb!<Br/>"

   Call ZBToSnWb_BG


Function LoadSetting(settingtype,name)
 Call LoadValueForSetting(tmpSng,True,settingtype,name,Null)
End Function

Function SaveSetting(settingtype,setname,content)
 SaveSetting=SaveValueForSetting(tmpSng,True,settingtype,setname,content)
End Function