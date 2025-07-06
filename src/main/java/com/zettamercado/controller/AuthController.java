package com.zettamercado.controller;

import com.zettamercado.dto.LoginRequest;
import com.zettamercado.dto.LoginResponse;
import com.zettamercado.dto.RegisterRequest;
import com.zettamercado.dto.UsuarioDTO;
import com.zettamercado.security.JwtTokenProvider;
import com.zettamercado.security.TwoFactorAuthService;
import com.zettamercado.service.UsuarioService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
@Tag(name = "Autenticação", description = "Endpoints para autenticação de usuários")
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtTokenProvider tokenProvider;
    private final UsuarioService usuarioService;
    private final TwoFactorAuthService twoFactorAuthService;

    @PostMapping("/register")
    @Operation(summary = "Registrar novo usuário")
    public ResponseEntity<UsuarioDTO> register(@Valid @RequestBody RegisterRequest request) {
        UsuarioDTO usuario = usuarioService.registrarUsuario(request);
        return ResponseEntity.ok(usuario);
    }

    @PostMapping("/login")
    @Operation(summary = "Realizar login (primeira etapa)")
    public ResponseEntity<LoginResponse> login(@Valid @RequestBody LoginRequest request) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getEmail(), request.getSenha())
        );

        String token = tokenProvider.generateToken(authentication);
        String qrCodeUrl = null;

        // Se for primeiro login, gera QR Code para 2FA
        if (usuarioService.isPrimeiroLogin(request.getEmail())) {
            String secret = twoFactorAuthService.generateNewSecret();
            usuarioService.salvarSecret2FA(request.getEmail(), secret);
            qrCodeUrl = twoFactorAuthService.generateQrCodeImageUri(secret);
        }

        return ResponseEntity.ok(new LoginResponse(token, qrCodeUrl));
    }

    @PostMapping("/verify-2fa")
    @Operation(summary = "Verificar código 2FA (segunda etapa)")
    public ResponseEntity<LoginResponse> verify2FA(@RequestParam String email, @RequestParam String code) {
        if (usuarioService.verificar2FA(email, code)) {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(email, "")
            );
            String token = tokenProvider.generateToken(authentication);
            return ResponseEntity.ok(new LoginResponse(token, null));
        }
        return ResponseEntity.badRequest().build();
    }

    @PostMapping("/refresh-token")
    @Operation(summary = "Renovar token de acesso")
    public ResponseEntity<LoginResponse> refreshToken(@RequestHeader("Authorization") String token) {
        if (tokenProvider.validateToken(token.replace("Bearer ", ""))) {
            Authentication authentication = tokenProvider.getAuthentication(token.replace("Bearer ", ""));
            String newToken = tokenProvider.generateToken(authentication);
            return ResponseEntity.ok(new LoginResponse(newToken, null));
        }
        return ResponseEntity.badRequest().build();
    }
} 