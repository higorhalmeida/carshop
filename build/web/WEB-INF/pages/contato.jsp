<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <%@include file="/WEB-INF/includes/head.jsp" %>
    <%@include file="/WEB-INF/includes/topMenu.jsp" %>

    <%
        String error = (String) request.getAttribute( "error" );
        String success = (String) request.getAttribute( "success" );
    %>

    <div class="container" style="min-height: 600px;">
        
        <div class="row">
            <div class="col s12">
                <h3>Preencha o formulário para entrar em contato com o maior site de anuncios do Brasil</h3>
            </div>

            <% if ( error != null ) { %>

            <div class="col s12">
                <div class="card-panel red lighten-2 center-align">
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
        
            <form class="col s12" method="POST" name="contato" onsubmit="return formContatoValidate()">
                
                <div class="row">
                    <div class="input-field col s12 m12 l6 xl6">
                        <input id="nome" name="nome" type="text" class="validate" onblur="onBlurNomeValidate( this )" required="required">
                        <label for="nome">Nome</label>
                        <small id="nomeValidate" class="hide red-text">Informe um nome válido.</small>
                    </div>
                </div>
                
                <div class="row">
                    <div class="input-field col s12 m12 l6 xl6">
                        <input id="email" type="email" name="email" class="validate" onblur="onBlurEmailValidate( this )" required="required">
                        <label for="email">E-mail</label>
                        <small id="emailValidate" class="hide red-text">Informe um email válido.</small>
                    </div>
                </div>
                
                <div class="row">
                    
                    <div class="input-field col s12">
                        <textarea id="mensagem" name="mensagem" class="materialize-textarea validate" onblur="onBlurMensagemValidate( this )" required="required"></textarea>
                        <label for="mensagem">Mensagem</label>
                        <small id="mensagemValidate" class="hide red-text">Sua mensagem deve conter, pelo menos, 50 caracteres.</small>
                    </div>
                    
                </div>
                
                <div class="row">
                    <input type="submit" value="Enviar Mensagem" class="waves-effect waves-light btn" />
                </div>
                
            </form>
        </div>

    </div>
    
        <script>
            /** Vars **/
            var nome = document['contato']['nome'];
            var email = document['contato']['email'];
            var mensagem = document['contato']['mensagem'];

            
            /** onBlur Validations **/
            
            function onBlurNomeValidate( nome ) {
                if ( !validateNome( nome ) ) {
                    nome.classList.remove( "validate" );
                    nome.classList.add( "invalid" );
                    document.getElementById("nomeValidate").classList.remove("hide");
                } else {
                    nome.classList.remove( "invalid" );
                    nome.classList.add( "valid" );
                    document.getElementById("nomeValidate").classList.add("hide");
                }
            }
            
            function onBlurEmailValidate( email ) {
                if ( !validateEmail( email ) ) {
                    email.classList.remove( "validate" );
                    email.classList.add( "invalid" );
                    document.getElementById("emailValidate").classList.remove("hide");
                } else {
                    email.classList.remove( "invalid" );
                    email.classList.add( "valid" );
                    document.getElementById("emailValidate").classList.add("hide");
                }
            }
            
            function onBlurMensagemValidate( mensagem ) {
                if ( !validateMensagem( mensagem ) ) {
                    mensagem.classList.remove( "validate" );
                    mensagem.classList.add( "invalid" );
                    document.getElementById("mensagemValidate").classList.remove("hide");
                } else {
                    mensagem.classList.remove( "invalid" );
                    mensagem.classList.add( "valid" );
                    document.getElementById("mensagemValidate").classList.add("hide");
                }
            }
            
            /** Form Validate ( submit ) **/
            function formContatoValidate() {
                
                if ( !validateNome( nome ) ) {
                    nome.classList.remove( "validate" );
                    nome.classList.add( "invalid" );
                    document.getElementById("nomeValidate").classList.remove("hide");
                    
                    return false;
                }
                
                if ( !validateEmail( email ) ) {
                    email.classList.remove( "validate" );
                    email.classList.add( "invalid" );
                    document.getElementById("emailValidate").classList.remove("hide");
                    
                    return false;
                }
                
                if ( !validateMensagem( mensagem ) ) {
                    mensagem.classList.remove( "validate" );
                    mensagem.classList.add( "invalid" );
                    document.getElementById("mensagemValidate").classList.remove("hide");
                    
                    return false;
                } 
                
                return true;
            }
            
            /** Used by Form Validate **/
            function validateNome( nome ) {
                return nome.value.length >= 3;
            }

            function validateEmail( email ) {
                var regexp = /(?!.*\.{2})^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
                return regexp.test( String( email.value ).toLowerCase() );
            }
            
            function validateMensagem( mensagem ) {
                return mensagem.value.length >= 50;
            }
        </script>
            
    <%@include file="/WEB-INF/includes/footer.jsp" %>
</html>