package org.example.webimc.util;

public class Usuario {
    private String nome;
    private String nivel;
    private String acesso;

    public Usuario(String nome, String nivel, String acesso) {
        this.nome = nome;
        this.nivel = nivel;
        this.acesso = acesso;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public String getAcesso() {
        return acesso;
    }

    public void setAcesso(String acesso) {
        this.acesso = acesso;
    }
}
