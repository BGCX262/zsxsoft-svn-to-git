'备份设置Begin 
Sub ZBToQQWb_BFSZ()
  Dim tmpSng
  Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>请稍等，正在备份配置..'</script>")
  If ZBToQQWb_Chajian("ZBToQQWb")="2.2" Then
	tmpSng="<%" & vbcrlf & Split(Split(LoadFromFile(BlogPath & "/PLUGIN/ZBToQQWb/config.asp","utf-8"),"'配置信息End")(0),"'配置信息Begin")(1) & vbcrlf & "%>"
	Call SaveToFile(BlogPath & "/Include/ZBToQQWb_ConfigBackup.asp",tmpSng,"utf-8",False)
  Else
   tmpSng=LoadFromFile(BlogPath & "/PLUGIN/ZBToQQWb/cfg.asp","utf-8")
	Call SaveToFile(BlogPath & "/Include/ZBToQQWb_ConfigBackup.asp",tmpSng,"utf-8",False)
  End If
End Sub
'备份设置End

   'Response.Write("<div style='position:absolute;top:1px;right:1px;height:15px;width:380px;margin:0;padding:5px 10px;background:#8B0000;color:#FFFFFF;font-size:12px;' id='d'>")
   Call ZBToQQWb_BFSZ
   If ZBToQQWb_Chajian("ZBToQQWb")="2.2" Then
   Call ZBToQQWb_SFKJ
   End If
   Call ZBToQQWb_XZWJ
  

'释放空间Begin
Sub ZBToQQWb_SFKJ()
   Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>请稍等，正在删除文件...'</script>")
   Set fs = Server.CreateObject("Scripting.FileSystemObject")
   File = BlogPath & "/PLUGIN/ZBToQQWb/config.asp"
   fs.DeleteFile File, True 
   Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>成功删除文件" & File & "'</script>")
   File = BlogPath & "/PLUGIN/ZBToQQWb/base64.asp"
   fs.DeleteFile File, True 
   Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>成功删除文件" & File & "'</script>")
   File = BlogPath & "/PLUGIN/ZBToQQWb/oauth.asp"
   fs.DeleteFile File, True 
   Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>成功删除文件" & File & "'</script>")
    Call SaveToFile(BlogPath & "/PLUGIN/ZBToQQWb/include.asp","","utf-8",False)
   Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>成功清空文件" & BlogPath & "/PLUGIN/ZBToQQWb/include.asp" & "'</script>")

End Sub
'释放空间End
'下载文件Begin
Sub ZBToQQWb_XZWJ()
   Response.Write("<script language='javascript'>document.all.g.innerHTML=document.all.g.innerHTML+'<br/>请稍等，正在下载文件...'</script>")
   Call SaveToFile(BlogPath & "/PLUGIN/PluginSapper/Export/ZBToQQWb.zpi",ZBToQQWb_GETHTTP("https://zsxsoft.googlecode.com/svn/Z-Blog/ZBtoQQWb.zpi?"&DateDiff("s", "1970-1-1 8:00:00", Now())),"utf-8",False)
   Response.Write("<script language='javascript'>var time = 5;function Redirect(){ window.location = '" &ZC_BLOG_HOST & "Plugin/PluginSapper/Xml_Restor.asp?act=Restore&id=ZBToQQWb&plugin=ZBToQQWb%2Ezpi&pluginname=ZBToQQWb'; }")
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

