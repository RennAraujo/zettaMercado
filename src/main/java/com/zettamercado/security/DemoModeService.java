package com.zettamercado.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class DemoModeService {

    @Value("${security.demo-mode.enabled:true}")
    private boolean demoModeEnabled;

    @Value("${security.demo-mode.token:demo-token}")
    private String demoToken;

    public boolean isDemoModeEnabled() {
        return demoModeEnabled;
    }

    public boolean isDemoToken(String token) {
        return demoModeEnabled && token != null && token.equals(demoToken);
    }

    public String generateDemoToken() {
        if (!demoModeEnabled) {
            throw new IllegalStateException("Demo mode is not enabled");
        }
        return demoToken;
    }
}