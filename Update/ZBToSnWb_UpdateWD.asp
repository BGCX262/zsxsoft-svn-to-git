'备份设置Begin 
Sub ZBToSnWb_BFSZ()
  Dim tmpSng
  Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>请稍等，正在备份配置..'</script>")
  If ZBToSnWb_Chajian("ZBToSnWb")="1.0" Then
	tmpSng="<%" & vbcrlf & Split(Split(LoadFromFile(BlogPath & "/PLUGIN/ZBToSnWb/config.asp","utf-8"),"'配置信息End")(0),"'配置信息Begin")(1) & vbcrlf & "%>"
	Call SaveToFile(BlogPath & "/Include/ZBToSnWb_ConfigBackup.asp",tmpSng,"utf-8",False)
  Else
  tmpSng=LoadFromFile(BlogPath & "/PLUGIN/ZBToSnWb/cfg.asp","utf-8")
	Call SaveToFile(BlogPath & "/Include/ZBToSnWb_ConfigBackup.asp",tmpSng,"utf-8",False)
  End If
End Sub
'备份设置End

   Call ZBToSnWb_BFSZ
   If ZBToSnWb_Chajian("ZBToSnWb")<>"2.0" Then 
   Call ZBToSnWb_SFKJ
   End If
   Call ZBToSnWb_XZWJ
  

'释放空间Begin
Sub ZBToSnWb_SFKJ()
   Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>请稍等，正在删除文件...'</script>")
   Set fs = Server.CreateObject("Scripting.FileSystemObject")
   File = BlogPath & "/PLUGIN/ZBToSnWb/config.asp"
   fs.DeleteFile File, True 
   Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>成功删除文件" & File & "'</script>")
   File = BlogPath & "/PLUGIN/ZBToSnWb/base64.asp"
   fs.DeleteFile File, True 
   Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>成功删除文件" & File & "'</script>")
   File = BlogPath & "/PLUGIN/ZBToSnWb/oauth.asp"
   fs.DeleteFile File, True 
   Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>成功删除文件" & File & "'</script>")
    Call SaveToFile(BlogPath & "/PLUGIN/ZBToSnWb/include.asp","","utf-8",False)
   Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>成功清空文件" & BlogPath & "/PLUGIN/ZBToSnWb/include.asp" & "'</script>")

End Sub
'释放空间End
'下载文件Begin
Sub ZBToSnWb_XZWJ()
   Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>请稍等，正在下载文件...'</script>")
   Call SaveToFile(BlogPath & "/PLUGIN/PluginSapper/Export/ZBToSnWb.zpi",ZBToSnWb_GETHTTP("https://zsxsoft.googlecode.com/svn/Z-Blog/ZBtoSnWb.zpi?"&DateDiff("s", "1970-1-1 8:00:00", Now())),"utf-8",False)
   Response.Write("<script language='javascript'>var time = 5;function Redirect(){ window.location = '" &ZC_BLOG_HOST & "Plugin/PluginSapper/Xml_Restor.asp?act=Restore&id=ZBToSnWb&plugin=ZBToSnWb%2Ezpi&pluginname=ZBToSnWb'; }")
   Response.Write("var i=0;function dis(){ document.all.g.innerHTML=document.all.g.innerHTML+'<br/>文件下载完成！' +(time - i) + '秒后进行更新！';i++;} ")
   Response.Write("timer=setInterval('dis()', 1000);timer=setTimeout('Redirect()',time * 1000);</script>")
End Sub
'下载文件End






Function LoadSetting(settingtype,name)
 Call LoadValueForSetting(tmpSng,True,settingtype,name,Null)
 response.write tmpsng
End Function

Function SaveSetting(settingtype,setname,content)
Call SaveValueForSetting(tmpSng,True,settingtype,setname,content)
End Function