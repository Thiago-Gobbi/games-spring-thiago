package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.model.Categoria;
import application.repository.CategoriaRepository;

@Controller
@RequestMapping("/categoria")
public class CategoriaController {

    @Autowired
    private CategoriaRepository categoriaRepo;

    // Método para listar todas as categorias
    @RequestMapping("/list")
    public String list(Model ui) {
        ui.addAttribute("categorias", categoriaRepo.findAll());
        return "categoria/list";  // Corrigido de "categoria/ist" para "categoria/list"
    }

    // Método para exibir o formulário de inserção de categoria
    @RequestMapping("/insert")
    public String insert() {
        return "categoria/insert";
    }
    
    // Método para inserir uma nova categoria
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestParam("nome") String nome) {
        Categoria categoria = new Categoria();
        categoria.setNome(nome);

        categoriaRepo.save(categoria);  // Corrigido de "categoriaRepo.saveNome(nome)" para "categoriaRepo.save(categoria)"

        return "redirect:/categoria/list";  // Redireciona para a lista de categorias
    }

    // Método para exibir o formulário de atualização de categoria
    @RequestMapping("/update")
    public String update(@RequestParam("id") long id, Model ui) {
        Optional<Categoria> categoria = categoriaRepo.findById(id);
        
        if (categoria.isPresent()) {
            ui.addAttribute("categoria", categoria.get());
            return "categoria/update";
        }

        return "redirect:/categoria/list";  // Corrigido "rdirect:/categoria/list" para "redirect:/categoria/list"
    }

    // Método para atualizar uma categoria existente
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam("id") long id, @RequestParam("nome") String nome) {
        Optional<Categoria> categoria = categoriaRepo.findById(id);

        if (categoria.isPresent()) {
            categoria.get().setNome(nome);
            categoriaRepo.save(categoria.get());  // Atualizando a categoria no banco
        }

        return "redirect:/categoria/list";  // Redireciona para a lista de categorias
    }

    // Método para exibir o formulário de deleção de categoria
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") long id, Model ui) {
        Optional<Categoria> categoria = categoriaRepo.findById(id);

        if (categoria.isPresent()) {
            ui.addAttribute("categoria", categoria.get());
            return "categoria/delete";
        }

        return "redirect:/categoria/list";  // Redireciona caso a categoria não seja encontrada
    }

    // Método para deletar uma categoria
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("id") long id) {
        categoriaRepo.deleteById(id);  // Deleta a categoria do banco

        return "redirect:/categoria/list";  // Redireciona para a lista de categorias
    }
}
