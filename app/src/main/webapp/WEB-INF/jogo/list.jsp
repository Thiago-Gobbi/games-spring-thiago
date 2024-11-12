<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Jogos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Barra de Navegação -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Sistema de Jogos</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/jogo/list">Jogos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/categoria/list">Categorias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/plataforma/list">Plataformas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Conteúdo Principal -->
        <div class="container mt-5">
            <h1>Jogos</h1>
            
            <!-- Botão para adicionar um novo jogo -->
            <a href="/jogo/insert" class="btn btn-primary mb-3">Novo Jogo</a>
            
            <!-- Tabela de Listagem de Jogos -->
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Título</th>
                        <th>Categoria</th>
                        <th>Plataformas</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Loop para exibir jogos -->
                    <c:forEach var="item" items="${jogos}">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.titulo}</td>
                            <td>${item.categoria.nome}</td>
                            <td>
                                <!-- Loop para exibir plataformas associadas ao jogo -->
                                <c:forEach var="p" items="${item.plataformas}">
                                    ${p.nome}<c:if test="${not empty p}">, </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <a href="/jogo/update?id=${item.id}" class="btn btn-warning">Editar</a>
                                <a href="/jogo/delete?id=${item.id}" class="btn btn-danger">Excluir</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Scripts do Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
    </body>
</html>
