package br.com.grupointegrado.util;

public class AnuncioValidate {
    
    public static boolean tituloValidate( String titulo ) {
        return titulo != null && titulo.length() >= 10;
    }
    
    public static boolean anoFabricacaoValidate( Integer fabricacao ) {
        return fabricacao != null && fabricacao >= 1950;
    }
    
    public static boolean anoModeloValidate( Integer modelo, Integer fabricacao ) {
        return modelo != null && modelo == fabricacao || modelo == fabricacao + 1 ;
    }
    
    public static boolean kmValidate( Integer km ) {
        return km != null && km >= 0;
    }
    
    public static boolean valorValidate( String valor ) {
        return valor != null && valor.length() >= 3;
    }
    
    public static boolean combustivelValidate( String combustivel ) {
        return combustivel != null && combustivel.length() >= 3;
    }
    
    public static boolean categoriaValidate( Integer categoria ) {
        return categoria != null && categoria > 0;
    }
    
    public static boolean descricaoValidate( String descricao ) {
        return descricao != null && descricao.length() >= 50;
    }
    
}
