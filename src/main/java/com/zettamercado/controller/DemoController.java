package com.zettamercado.controller;

import com.zettamercado.security.DemoModeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/demo")
@RequiredArgsConstructor
@Tag(name = "Demonstração", description = "Endpoints para acesso em modo demonstração")
public class DemoController {

    private final DemoModeService demoModeService;

    @GetMapping("/token")
    @Operation(summary = "Obter token de demonstração")
    public ResponseEntity<Map<String, String>> getDemoToken() {
        if (!demoModeService.isDemoModeEnabled()) {
            return ResponseEntity.notFound().build();
        }
        
        String token = demoModeService.generateDemoToken();
        return ResponseEntity.ok(Map.of(
            "token", token,
            "type", "Bearer",
            "message", "Use este token no header Authorization para acessar todas as funcionalidades em modo demonstração"
        ));
    }
} 