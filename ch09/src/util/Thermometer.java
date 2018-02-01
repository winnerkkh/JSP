package util;

import java.util.HashMap;
import java.util.Map;

public class Thermometer {
	//map객체 생성
	private Map<String, Double> locationCelsiusMap
	             = new HashMap<String,Double>();
	
	public void setCelsius(String location, Double value) {
		locationCelsiusMap.put(location, value);
	}
	
	//map에서 로케이션 정보로 온도를 리턴함
	public Double getCelsius(String location) {
		return locationCelsiusMap.get(location);
	}
	
	//특정 지역의 섭씨; -> 화씨로 변환
	public Double getFahrenheit(String location) {
		Double celsius = getCelsius(location);
		
		if(celsius ==null)
			return null;
		return celsius.doubleValue()*1.8 + 32.0;/* 섭씨 -> 화씨 */
	}
	
	public String getInfo() {
		return "온도계 변환기 1.1";
	}
	
}
