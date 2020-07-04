package com.blog.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

//json日期格式转换
public class DateJsonValueProcessor implements JsonValueProcessor{
	 private String format;
	 
	 public DateJsonValueProcessor(String format) {
			this.format = format;
		}
	 
	@Override
	public Object processArrayValue(Object arg0, JsonConfig arg1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object processObjectValue(String key, Object value, JsonConfig arg2) {
		if(value==null) {
			return "";
		}
		if(value instanceof Timestamp) {
			String str = new SimpleDateFormat(this.format).format((Timestamp)value);
			return str;
		}
		if(value instanceof Date) {
			String str = new SimpleDateFormat(this.format).format((Date)value);
			return str;
		}
		
		return value.toString();
	}

}
