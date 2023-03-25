package com.shyam.gujarat_police.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Arrays;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class APIResponse {

    public APIResponse() {
    }

    @JsonProperty("content")
    private Object data = null;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @JsonProperty("timestamp")
    private Long timestamp;

    @JsonProperty("page")
    @JsonInclude(value = JsonInclude.Include.NON_NULL)
    private PageResponse pageResponse;

    @JsonProperty("response")
    private CommonResponse response = new CommonResponse();

    public APIResponse(Object obj) {
        data = obj;
    }

    public APIResponse(Object obj, String message) {
        data = obj;
        response.setMessage(message);
    }

    public static APIResponse ok(Object objects) {
        return new APIResponse(objects);
    }

    public static APIResponse ok() {
        return new APIResponse();
    }

    public static APIResponse ok(Object objects, String message) {
        return new APIResponse(objects, message);
    }

    public static APIResponse ok(String message) {
        APIResponse resp = new APIResponse();
        resp.setData(Arrays.asList());
        resp.getResponse().setMessage(message);
        return resp;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public static APIResponse error(String message) {
        APIResponse resp = new APIResponse();
        resp.setData(null);
        resp.getResponse().setError(1);
        resp.getResponse().setMessage(message);
        return resp;
    }

    public static APIResponse error(Object data, String message) {
        APIResponse resp = new APIResponse();
        resp.setData(data);
        resp.getResponse().setError(1);
        resp.getResponse().setMessage(message);
        return resp;
    }

    public static APIResponse error(int code, String message) {
        APIResponse resp = new APIResponse();
        resp.setData(null);
        resp.getResponse().setError(code);
        resp.getResponse().setMessage(message);
        return resp;
    }

    public APIResponse(Object obj, PageResponse page) {
        data = obj;
        pageResponse = page;
    }

    public static APIResponse ok(Object objects, PageResponse page) {
        return new APIResponse(objects, page);
    }

    public CommonResponse getResponse() {
        return response;
    }

    public void setResponse(CommonResponse response) {
        this.response = response;
    }

    public Long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Long timestamp) {
        this.timestamp = timestamp;
    }

}

