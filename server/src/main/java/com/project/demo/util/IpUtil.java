package com.project.demo.util;

import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class IpUtil {
    /**

     * 获取Ip地址

     * @param request

     * @return

     */

    public static String getIpAdrress(HttpServletRequest request) {

        String Xip = request.getHeader("X-Real-IP");

        String XFor = request.getHeader("X-Forwarded-For");

        if(StringUtils.isNotEmpty(XFor) && !"unKnown".equalsIgnoreCase(XFor)){

//多次反向代理后会有多个ip值，第一个ip才是真实ip

            int index = XFor.indexOf(",");

            if(index != -1){

                return XFor.substring(0,index);

            }else{

                return XFor;

            }

        }

        XFor = Xip;

        if(StringUtils.isNotEmpty(XFor) && !"unKnown".equalsIgnoreCase(XFor)){

            return XFor;

        }

        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {

            XFor = request.getHeader("Proxy-Client-IP");

        }

        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {

            XFor = request.getHeader("WL-Proxy-Client-IP");

        }

        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {

            XFor = request.getHeader("HTTP_CLIENT_IP");

        }

        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {

            XFor = request.getHeader("HTTP_X_FORWARDED_FOR");

        }

        if (StringUtils.isBlank(XFor) || "unknown".equalsIgnoreCase(XFor)) {

            XFor = request.getRemoteAddr();

        }

        return XFor;

    }

    /**
     * 3.通过调用接口根据ip获取归属地
     */
    public static String getGeoByIP(String ip)
    {

        try
        {
            String URL = "http://whois.pconline.com.cn/ipJson.jsp?ip=" + ip + "&json=true";
            RestTemplate restTemplate = new RestTemplate();
            String sJson = restTemplate.getForObject(URL,String.class);
            JSONObject json = JSON.parseObject(sJson);
            String region = json.getString("pro");
            return region;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return "未知";
    }


}
