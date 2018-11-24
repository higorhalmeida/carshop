<%@page import="br.com.grupointegrado.model.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <%@include file="/WEB-INF/includes/head.jsp" %>
    <%@include file="/WEB-INF/includes/topMenu.jsp" %>

    <%
        String error = (String) request.getAttribute( "error" );
        String success = (String) request.getAttribute( "success" );
    %>

    <div class="container">
        
        <div class="row">
            <% if ( error != null ) { %>
            <div class="col s12">
                <div class="card-panel red lighten-2 certer-align">
                    <%= error %>
                </div>
            </div>
            <% } %>
        
            <% if ( success != null ) { %>
            <div class="col s12">
                <div class="card-panel green lighten-2">
                    <%= success %>
                </div>
            </div>
            <% } %>
        
            <div class="col s12">
                <h3>Preencha os dados do anuncio</h3>
            </div>
        
        
            <form class="col s12" method="POST" enctype="multipart/form-data" name="anuncio">
                
                <div class="row">
                    <div class="input-field col s12 m12 l8 xl8">
                        <input id="titulo" name="titulo" type="text" class="" onblur="onBlurValidadeTitulo( this )">
                        <label for="titulo">Titulo</label>
                    </div>
                </div>
                
                <div class="row">
                    <div class="input-field col s6 m6 l4 xl4">
                        <input id="anoFabricacao" type="text" name="anoFabricacao" class="validate">
                        <label for="anoFabricacao">Ano de Fabricação</label>
                    </div>
                    
                    <div class="input-field col s6 m6 l4 xl4">
                        <input id="anoModelo" type="text" name="anoModelo" class="validate">
                        <label for="anoModelo">Ano do Modelo</label>
                    </div>
                </div>
                
                <div class="row">
                    
                    <div class="input-field col s6 m6 l4 xl4">
                        <input id="km" type="text" name="km" class="validate">
                        <label for="km">Quilometragem</label>
                    </div>
                    
                    <div class="input-field col s6 m6 l4 xl4">
                        <input id="valor" type="text" name="valor" class="validate">
                        <label for="valor">Valor</label>
                    </div>
                    
                </div>
                
                <div class="row">
                    <div class="input-field col s12 m12 l8 xl8">
                        
                        <select name="combustivel">
                            <option value="Gasolina">Gasolina</option>
                            <option value="Alcool">Alcool</option>
                            <option value="Flex">Flex</option>
                            <option value="Biogás">Biogás</option>
                        </select>
                        
                        <label>Tipo de Combustível</label>
                        
                    </div>

                </div>
                
                <div class="row">
                    
                    <div class="input-field col s12 m12 l8 xl8">
                        
                        <%
                            List< Categoria > categoria = (List) request.getAttribute( "categoria" );
                        %>
                        
                        <select name="categoria">
                        <% for ( Categoria c : categoria ) { %>
                            <option value="<%= c.getId() %>"><%= c.getNome() %></option>
                        <% } %>
                        </select>
                        
                        <label>Categoria</label>
                        
                    </div>

                </div>
                
                <div class="row">
                    <div class="file-field input-field col s12 m12 l8 xl8">
                        
                        <div class="btn">
                            <span>Imagem</span>
                            <input type="file" name="imagem" accept="image/png,image/jpg,image/jpeg" />
                        </div>
                        <div class="file-path-wrapper">
                            <input id="imagem" type="text" class="validate file-path" placeholder="Insira a imagem do seu anuncio">
                        </div>
                        
                    </div>
                </div>
                
                <div class="row">
                    
                    <div class="input-field col s12">
                        <textarea id="descricao" name="descricao" class="materialize-textarea"></textarea>
                        <label for="descricao">Descrição</label>
                    </div>
                    
                </div>
                
                <div class="row">
                    <input type="submit" value="Cadastrar" class="waves-effect waves-light btn" />
                </div>
                    
            </form>

        </div>
                        
    </div>
        
    <!-- Javascript -->
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('select');
            var instances = M.FormSelect.init( elems );
        });

        $(document).ready(function(){
            $('select').formSelect();
        });
    </script>
    
    <script type="text/javascript">
        
        function validadeTitulo( titulo ) {
            return titulo.value.length > 10;
        }
        
        function onBlurValidadeTitulo( titulo ) {
            if ( titulo.value.length < 10 ) {
                titulo.classList.remove( "validate" );
                titulo.classList.add( "invalid" );
            } else {
                titulo.classList.remove( "invalid" );
                titulo.classList.add( "valid" );
            }
        }

        function validateAnoFabricacao( anoFabricacao ) {
            var minimePossible = 1950;
            return anoFabricacao >= minimePossible;
        }
        
        function validateAnoModelo( anoModelo, anoFabricacao ) {
            var maxPossible = anoFabricacao + 1;
            return anoModelo === anoFabricacao || anoModelo === maxPossible;
        }

        function validateSelectField( select ) {
            return select.value != null || select.value != "" || select.value != undefined;
        }

        function validateFileField( fileInput ) {
            return fileInput.value != null || fileInput.value != "" || fileInput.value != undefined
        }

        function validateDescricao( descricao ) {
            return descricao.length > 50;
        }
        
    </script>
    
    <%@include file="/WEB-INF/includes/footer.jsp" %>
</html>