package br.com.grupointegrado.model;

import java.util.Arrays;
import java.util.Objects;

public class Documento {
    
    private String nome;
    private byte[] bytes;
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public byte[] getBytes() {
        return bytes;
    }
    
    public void setBytes(byte[] bytes) {
        this.bytes = bytes;
    }
    
    boolean haveContent() {
        return bytes != null && bytes.length > 0 && nome != null && nome.length() > 0;
    }
    
    @Override
    public String toString() {
        return this.getNome() + " " + this.getBytes();
    }
    
    @Override
    public int hashCode() {
        int hash = 3;
        hash = 23 * hash + Objects.hashCode(this.nome);
        hash = 23 * hash + Arrays.hashCode(this.bytes);
        return hash;
    }
     @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Documento other = (Documento) obj;
        if (!Objects.equals(this.nome, other.nome)) {
            return false;
        }
        if (!Arrays.equals(this.bytes, other.bytes)) {
            return false;
        }
        return true;
    }
}
