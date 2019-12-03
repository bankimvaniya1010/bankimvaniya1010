using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for Logger
/// </summary>
public class Logger
{
    public  void WriteLog(string strLog)
    {
        string univerityName = Utility.GetUniversityName();
        string logFilePath = ConfigurationManager.AppSettings["Path"].ToString() + "\\" + univerityName + "\\Log-" + DateTime.Today.ToString("MM-dd-yyyy") + "." + "txt";
        FileInfo logFileInfo = new FileInfo(logFilePath);
        DirectoryInfo logDirInfo = new DirectoryInfo(logFileInfo.DirectoryName);
        if (!logDirInfo.Exists) logDirInfo.Create();
        using (FileStream fileStream = new FileStream(logFilePath, FileMode.Append))
        {
            using (StreamWriter log = new StreamWriter(fileStream))
            {
                log.WriteLine(strLog);
            }
        }
    }

}
