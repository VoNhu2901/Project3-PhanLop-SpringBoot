package com.nashtech.ecommercialwebsite.config;

import com.cloudinary.Cloudinary;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class CloudinaryConfiguration {

    @Bean
    public Cloudinary cloudinary() {
        Map<String, String> valueMap = new HashMap<>();
        valueMap.put("cloud_name", "diel2oapd");
        valueMap.put("api_key", "477988126957355");
        valueMap.put("api_secret", "ZZS1gN3TkkHDTN_HaJr0Mk8w0YM");
        return new Cloudinary(valueMap);
    }
}
