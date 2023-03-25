package com.shyam.gujarat_police.util;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ObjectMapperUtil {

	private static final ObjectMapper mapper = new ObjectMapper();

	public static <T> T toObject(String jsonObject, Class<T> clazz)
			throws JsonParseException, JsonMappingException, IOException {
		return mapper.readValue(jsonObject, clazz);
	}

	public static <T> T toObject(Map<String, Object> requestParams, Class<T> clazz) {
		return mapper.convertValue(requestParams, clazz);
	}

	public static String toString(Object classObject) throws JsonProcessingException {
		return mapper.writeValueAsString(classObject);
	}

	public static Map<String, Object> toMap(String jsonInStringType)
			throws JsonParseException, JsonMappingException, IOException {
		return mapper.readValue(jsonInStringType, new TypeReference<HashMap<String, Object>>() {
		});
	}

	public static <T> T toGenericMap(String jsonInStringType, T type)
			throws JsonParseException, JsonMappingException, IOException {
		return mapper.readValue(jsonInStringType, new TypeReference<T>() {
		});
	}

}
