package com.action;

import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;

public class DatabaseAction extends BaseAction {
	public void databaseBak()
	{
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd"); // 格式化当前系统日期 
        String dateTime = dateFm.format(new java.util.Date()); 
        File file = null; 
        InputStream is = null; 
        String fileName = null; 
        int fileSize = 0; 
        //mysql备份语句  mysqldump -uroot -proot db_shuifeimm_g > c:\\2.sql
        String mysql = "mysqldump -uroot -proot db_shuifeimm_g > c:\\" + "data_sf" + dateTime + ".sql";
        Process proexec ;
        try{ 
          proexec=Runtime.getRuntime().exec("cmd /c"+mysql);
         
        } catch (Exception e){ 
            e.printStackTrace(); 
        }
        System.out.println("数据库备份成功!");
	}
}