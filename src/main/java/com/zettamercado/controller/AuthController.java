package com.zettamercado.controller;

import com.zettamercado.domain.Usuario;
import com.zettamercado.dto.RegisterRequest;
import com.zettamercado.dto.UsuarioDTO;
import com.zettamercado.service.UsuarioService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;


@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
@Tag(name = "Autenticação", description = "Endpoints para registro de usuários")
public class AuthController {

    private final UsuarioService usuarioService;

    @PostMapping("/register")
    @Operation(summary = "Registrar novo usuário")
    public ResponseEntity<UsuarioDTO> register(@Valid @RequestBody RegisterRequest request) {
        UsuarioDTO usuario = usuarioService.registrarUsuario(request);
        return ResponseEntity.ok(usuario);
    }

    @GetMapping("/demo")
    @Operation(summary = "Endpoint de demonstração")
    public ResponseEntity<String> demo() {
        return ResponseEntity.ok("Sistema funcionando sem autenticação!");
    }

    @PostMapping("/recruiter-access")
    @Operation(summary = "Acesso para recrutadores sem cadastro")
    public ResponseEntity<UsuarioDTO> recruiterAccess() {
        // Criar usuário temporário para recrutadores
        UsuarioDTO recruiterUser = new UsuarioDTO();
        recruiterUser.setId("00000000-0000-0000-0000-000000000999");
        recruiterUser.setNome("Recrutador");
        recruiterUser.setEmail("recruiter@demo.com");
        recruiterUser.setPerfil(Usuario.PerfilUsuario.DEMO);
        recruiterUser.setStatus(Usuario.StatusUsuario.ATIVO);
        recruiterUser.setDataCriacao(LocalDateTime.now());
        recruiterUser.setDataAtualizacao(LocalDateTime.now());
        
        return ResponseEntity.ok(recruiterUser);
    }
}