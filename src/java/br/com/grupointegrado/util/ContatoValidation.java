package br.com.grupointegrado.util;

public class ContatoValidation {
    
    public static boolean nomeValidate( String nome ) {
        return nome != null && nome.length() >= 3;
    }
    
    public static boolean emaiValidate( String email ) {
        return email != null  && email.contains("@");
    }
    
    public static boolean mensagemValidate( String mensagem ) {
        return mensagem != null && mensagem.length() >= 20;
    }
}
 