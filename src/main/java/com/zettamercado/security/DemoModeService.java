package com.zettamercado.security;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DemoModeService {

    @Value("${security.demo-mode.enabled}")
    private boolean demoModeEnabled;

    @Value("${security.demo-mode.token}")
    private String demoToken;

    private final JwtTokenProvider tokenProvider;

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
        return tokenProvider.generateDemoToken();
    }
} 