package com.szlhsoft.core.util;

/*import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;*/
import com.google.gson.JsonSerializer;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class JsonDateSerializer {
	private SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  

	public void serialize(Date date) throws IOException{
		// TODO Auto-generated method stub
		String value = dateFormat.format(date);  

	}

}
