package com.zettamercado.service;

import com.zettamercado.domain.Usuario;
import com.zettamercado.dto.RegisterRequest;
import com.zettamercado.dto.UsuarioDTO;
import com.zettamercado.mapper.UsuarioMapper;
import com.zettamercado.repository.UsuarioRepository;
import com.zettamercado.security.TwoFactorAuthService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UsuarioService {

    private final UsuarioRepository usuarioRepository;
    private final UsuarioMapper usuarioMapper;
    private final PasswordEncoder passwordEncoder;
    private final TwoFactorAuthService twoFactorAuthService;

    @Transactional
    public UsuarioDTO registrarUsuario(RegisterRequest request) {
        if (usuarioRepository.existsByEmail(request.getEmail())) {
            throw new IllegalArgumentException("Email já cadastrado");
        }

        Usuario usuario = new Usuario();
        usuario.setNome(request.getNome());
        usuario.setEmail(request.getEmail());
        usuario.setSenha(passwordEncoder.encode(request.getSenha()));
        usuario.setPerfil(Usuario.PerfilUsuario.USER);
        usuario.setStatus(Usuario.StatusUsuario.ATIVO);

        return usuarioMapper.toDTO(usuarioRepository.save(usuario));
    }

    @Transactional(readOnly = true)
    public boolean isPrimeiroLogin(String email) {
        return usuarioRepository.findByEmail(email)
                .map(usuario -> usuario.getSecret2FA() == null)
                .orElse(false);
    }

    @Transactional
    public void salvarSecret2FA(String email, String secret) {
        Usuario usuario = usuarioRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuário não encontrado"));
        usuario.setSecret2FA(secret);
        usuarioRepository.save(usuario);
    }

    @Transactional(readOnly = true)
    public boolean verificar2FA(String email, String code) {
        return usuarioRepository.findByEmail(email)
                .map(usuario -> twoFactorAuthService.validateCode(code, usuario.getSecret2FA()))
                .orElse(false);
    }

    @Transactional(readOnly = true)
    public UsuarioDTO buscarPorEmail(String email) {
        return usuarioRepository.findByEmail(email)
                .map(usuarioMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Usuário não encontrado"));
    }
} 